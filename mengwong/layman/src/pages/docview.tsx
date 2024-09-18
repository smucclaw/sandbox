import React, { useState, useReducer, useCallback } from 'react';
import { Vine, AnyAll, Any, All, Leaf, Fill, HideShow, any, all, ele, say, com } from '@/woon';
import Flow from '@/pages/flow';
import _ from 'lodash';
import {Node} from 'reactflow';

export const DocView: React.FC<Props> = ({ doc }) => {
  const init = (initialContent:Vine) => initialContent.clone(); // Initialize with a deep copy to avoid mutations
  const [root, dispatch] = useReducer(reducer, doc.content, init);
  const toggleExpandAll = () => {
    dispatch({type: root.viz !== HideShow.Collapsed ? 'COLLAPSE' : 'EXPAND'});
  };
  
  const [flowNodes, setFlowNodes] = useState(root.getFlowNodes({x:0, y:0}))
  const [flowEdges, setFlowEdges] = useState(root.getFlowEdges())

  const [highlightedNodeId, setHighlightedNodeId] = useState<string | null>(null)
  const handleNodeClick = useCallback((nodeId: string) => {
    setHighlightedNodeId(prevId => prevId === nodeId ? null : nodeId)
  }, [])
  
  const handleNodesChange = useCallback((updatedNodes: Node[]) => {
    console.log('Updated nodes:', updatedNodes);
    setFlowNodes(updatedNodes);
  }, []);  

  const highlightFlowNodes = useCallback((nodeIds: number[]) => {
    console.log("flowNodes", flowNodes)
    const updatedNodes = flowNodes.map(node => {
      console.log("all the nodes", node)
  
      if (node.type === `invisiHandles`) {
        const isHighlighted = nodeIds.includes(parseInt(node.id))
        return {
          ...node,
          className: isHighlighted ? 'highlight' : node.className
        }
      }
  
      return node
    })
  
    setFlowNodes(updatedNodes)

    const updatedEdges = flowEdges.map(edge => {
      const isHighlighted = nodeIds.some(id => 
        edge.source.includes(`${id}`) || edge.target.includes(`${id}`)
      )
      console.log(`Edge ${edge.id} (source: ${edge.source}, target: ${edge.target}) ${isHighlighted ? 'will be highlighted' : 'will not be highlighted'}`)
      return {
        ...edge,
        style: {
          ...edge.style,
          stroke: isHighlighted ? 'lime' : 'black',
        }
      }
    })
    setFlowEdges(updatedEdges)
  }, [flowNodes])

  const resetHighlight = useCallback(() => {
    setFlowNodes(prevNodes =>
      prevNodes.map(node => {
        if (node.type === `default`) {
          return {
            ...node,
            className: node.className?.includes('highlight') ? 'highlight' : node.className
          }
        }
  
        return {
          ...node,
          className: ''
        }
      })
    )
    setFlowEdges(prevEdges => 
      prevEdges.map(edge => ({
        ...edge,
        style: {
          ...edge.style,
          stroke: 'black'
        }
      }))
    )
  }, [])
 
  console.log(`DocView: root`, root)
  console.log(`DocView: flowNodes`, flowNodes)
  console.log(`DocView: flowEdges`, flowEdges)
  // console.log(`DocView: root`, root)
  // <textarea className="vineEditor" value={JSON.stringify(root, null, 2)} readOnly />
  const [textareaValue, setTextareaValue] = useState(doc.source == undefined ? "TBD" : doc.source);

  const handleTextareaChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    setTextareaValue(event.target.value);
  };

  const handleTextareaBlur = () => {
    dispatch({ type: 'NewVine', content: textareaValue });
  };

  return (
    <div style={{ marginTop: '20px' }}>
      <h1>{doc.title}</h1>

      <div className="original">
        <RenderOriginal key={`${doc.title}-showOriginal`} root={root} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes} resetHighlight={resetHighlight} highlightedNodeId={highlightedNodeId}
 />
      </div>

      <div style={{ width: '100%', height: '800px' }}>
        <Flow root={root} nodes={flowNodes} edges={flowEdges} dispatch={dispatch} onNodeClick={handleNodeClick} onNodesChange={handleNodesChange} />
      </div>

      <RenderVine root={root} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes} resetHighlight={resetHighlight} highlightedNodeId={highlightedNodeId} />

      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2>Combinations</h2>
        <button id="expansion" onClick={toggleExpandAll} style={{ marginLeft: 'auto' }}>
          {root.viz == HideShow.Collapsed ? 'Expand All' : 'Collapse All'}
        </button>
      </div>
      <RenderSentences key={`${doc.title}-topLevel`} root={root} dispatch={dispatch}
      highlightFlowNodes={highlightFlowNodes} resetHighlight={resetHighlight}  highlightedNodeId={highlightedNodeId} />
      {root.viz === HideShow.Expanded && (
        <div>
          <p className="pRight">
            When fully expanded, these are said to be in{' '}
            <a href="https://en.wikipedia.org/wiki/Disjunctive_normal_form" target="_new">
              disjunctive normal form.
            </a>
          </p>
        </div>
      )}

    { (doc.source != undefined) && (
      <div>
        <h2>Source</h2>
        <p>In a hopefully not too distant future this will be editable so you can change the L4 and the diagram will update.</p>
        <pre className="vineEditor">
          {textareaValue}
        </pre>
      </div>
    )}
    </div>
  );
};

export default DocView;


interface Props {
  doc: Document;
}

interface JustRoot {
  root: Vine;
  dispatch: MyDispatch;
  highlightFlowNodes: (nodeIds: number[]) => void;
  resetHighlight: () => void,
  highlightedNodeId: string | number | null;
}

type MyDispatch = React.Dispatch<MyAction>;

export type MyAction = {
  type: string,
  nodeID ?: number,
  content ?: string,
}
export interface Document {
  id: string;
  title: string;
  content: Vine;
  source ?: string;
}

export const RenderVine: React.FC<JustRoot> = ({ root }) => {
  // Render the tree visualization using a library of your choice
  // You can use the 'show' property to determine whether to render the node as expanded or collapsed
  // You can use the 'value' property to determine the state of the leaf nodes (true or false)
  return <></>
  // </><div><p>tree render goes here</p></div>
};

// during expansion of any/all, if these conditions match the parent and the child, don't show the child, because it is filler that only makes sense in a collapsed version.
const excludeFill0 = {
  fParent: (s: Vine) => (s instanceof All || (s instanceof Any && s.viz !== HideShow.Collapsed)),
  fChild: (p: Vine) => (p instanceof Fill && ['or', 'either', 'whether'].includes(p.fill)
  || p instanceof Leaf && ['or', 'either', 'whether'].includes(p.text))
};

const RenderNode: React.FC<{ node: Vine, dispatch: MyDispatch, highlightedNodeId: string | number | null;
}> = ({ node, dispatch, highlightedNodeId }) => {
  if (node instanceof Leaf) {
    return <li><b>{node.text}</b></li>;
  } else if (node instanceof Fill) {
    return <li onClick={(e) => {
      e.stopPropagation(); // Prevent event bubbling
      dispatch({type:"toggleParent", nodeID:node.id})
    }}>{node.fill}</li>;
  } else if (node instanceof AnyAll) {
    return <ul>
      {node.c.map((value: Vine, index: number, array: Vine[]) => RenderNode({
        node: value, dispatch: dispatch, highlightedNodeId: highlightedNodeId }))}
    </ul>;
  }
};

  const RenderExpanded: React.FC<{expanded: Vine[][], dispatch: MyDispatch,  highlightFlowNodes: (nodeIds: number[]) => void,  resetHighlight: () => void,
    highlightedNodeId: string | number | null}> = ({ expanded, dispatch, highlightFlowNodes, resetHighlight, highlightedNodeId }) => {


    return (
      <div>
        <ol>
          {expanded.map((item: Vine[], itemIndex: number) => {
            const nodeIds = item
            .map(node => node.id)
            .filter((id): id is number => id !== undefined)
            console.log("this Vine", item, nodeIds)

            const containsHighlightedNode = item.some(node => {
              return node.id == highlightedNodeId
            })
           
            return (
              <li key={itemIndex}
              onMouseEnter={() => highlightFlowNodes(nodeIds)}
              onMouseLeave={resetHighlight}>
              {}
              <ul className={`inline-list ${containsHighlightedNode ? 'highlight' : ''}`}>
                {item.map((node: Vine, index: number) => (
                  <RenderNode node={node} dispatch={dispatch} key={node.id || index} highlightedNodeId={highlightedNodeId} />
                ))}
              </ul>
            </li>
          )})}
        </ol>
      </div>
    )
  }

export const RenderOriginal: React.FC<JustRoot> = ({ root, dispatch , highlightFlowNodes, resetHighlight, highlightedNodeId}) => {
  const excludeFill = {...excludeFill0, ...{hideShowOverride: HideShow.Collapsed}}
  const expanded = root.expand(excludeFill)
  return <RenderExpanded expanded={expanded} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes}  resetHighlight={resetHighlight} highlightedNodeId={highlightedNodeId} />

}

export const RenderSentences: React.FC<JustRoot> = ({ root, dispatch, highlightFlowNodes, resetHighlight, highlightedNodeId }) => {
  const expanded = root.expand(excludeFill0)
  return <RenderExpanded expanded={expanded} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes} resetHighlight={resetHighlight} highlightedNodeId={highlightedNodeId} />
}

function reducer(root: Vine, action: MyAction): Vine {
  const toggleParentNode = (nodeID:number, node: Vine) => {
    if (node.id === nodeID) {
      node.toggleParent();
    } else if (node instanceof AnyAll) {
      node.c.forEach((childNode) => {
        toggleParentNode(nodeID, childNode);
      });
    }
  };

  console.log("reducer called with", action);
  const newRoot = root.clone()
  switch (action.type) {
    case 'EXPAND':
      newRoot.showAll(); return newRoot
    case 'COLLAPSE':
      newRoot.hideAll(); return newRoot
    case 'toggleParent':
      if (action.nodeID == undefined) {
        return newRoot;
      }
      toggleParentNode(action.nodeID, newRoot);
      return newRoot;
    case 'NewVine':
      if (action.content != undefined) {
	// return eval(action.content) as Vine
	// TODO eval doesn't work argh, returns "ReferenceError: com is not defined"
	return newRoot
      } else {
        return newRoot
      }
    default:
      return newRoot
  }
}
