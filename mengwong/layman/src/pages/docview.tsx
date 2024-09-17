import React, { useState, useReducer } from 'react';
import { Vine, AnyAll, Any, All, Leaf, Fill, HideShow, any, all, ele, say, com } from '@/woon';
import Flow from '@/pages/flow';
import _, { set } from 'lodash';
import { abcde_as_text } from '@/woon';

export const DocView: React.FC<Props> = ({ doc }) => {
  const init = (initialContent:Vine) => initialContent.clone(); // Initialize with a deep copy to avoid mutations
  const [root, dispatch] = useReducer(reducer, doc.content, init);
  const toggleExpandAll = () => {
    dispatch({type: root.viz !== HideShow.Collapsed ? 'COLLAPSE' : 'EXPAND'});
  };
  
  const [flowNodes, setFlowNodes] = useState(root.getFlowNodes({x:0, y:0}))
  const flowEdges = root.getFlowEdges()

  // update colour of mouseovered nodes
  const highlightFlowNodes = (item: any) => {
    const ids = item.map((obj: { id: any; })  => obj.id)

    const allNodes = document.querySelectorAll('.react-flow__node')

    allNodes.forEach(node => {
      const nodeId = node.getAttribute('data-id')

      if (nodeId !== null && ids.includes(parseInt(nodeId))) {
        console.log("allNodes", nodeId, node)
        if (node instanceof HTMLElement){node.style.backgroundColor=`greenyellow`}
      }
    })
  }

  console.log(`DocView: root`, root)
  console.log(`DocView: flowNodes`, flowNodes)
  console.log(`DocView: flowEdges`, flowEdges)
  // console.log(`DocView: root`, root)
  // <textarea className="vineEditor" value={JSON.stringify(root, null, 2)} readOnly />
  const [textareaValue, setTextareaValue] = useState(abcde_as_text);

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
        <RenderOriginal key={`${doc.title}-showOriginal`} root={root} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes} />
      </div>

      <div style={{ width: '100%', height: '800px' }}>
        <Flow root={root} nodes={flowNodes} edges={flowEdges} dispatch={dispatch} />
      </div>

      <RenderVine root={root} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes}/>

      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2>Combinations</h2>
        <button id="expansion" onClick={toggleExpandAll} style={{ marginLeft: 'auto' }}>
          {root.viz == HideShow.Collapsed ? 'Expand All' : 'Collapse All'}
        </button>
      </div>
      <RenderSentences key={`${doc.title}-topLevel`} root={root} dispatch={dispatch}
      highlightFlowNodes={highlightFlowNodes} />
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

      <div>
        <textarea className="vineEditor" value={textareaValue} onChange={handleTextareaChange} onBlur={handleTextareaBlur} />
      </div>
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
  highlightFlowNodes: (item: {}) => void;
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

const RenderNode: React.FC<{ node: Vine, dispatch: MyDispatch }> = ({ node, dispatch }) => {
    if (node instanceof Leaf) {
      return <li><b>{node.text}</b></li>;
    } else if (node instanceof Fill) {
      return <li onClick={(e) => {
        e.stopPropagation(); // Prevent event bubbling
        dispatch({type:"toggleParent", nodeID:node.id})
      }}>{node.fill}</li>;
    } else if (node instanceof AnyAll) {
      return <ul>
        {node.c.map((value: Vine, index: number, array: Vine[]) => RenderNode({node: value, dispatch: dispatch}))}
      </ul>;
    }
  };

  const RenderExpanded: React.FC<{expanded: Vine[][], dispatch: MyDispatch, highlightFlowNodes: (item: {}) => void}> = ({ expanded, dispatch, highlightFlowNodes }) => {

    const handleMouseEnter = (item: any) => {
      highlightFlowNodes(item)
    }

    const handleMouseLeave = () => {
      document.querySelectorAll('.react-flow__node').forEach(node => {
        if (node instanceof HTMLElement) {
          node.style.backgroundColor = 'transparent'
        }
      })
    }

    return (
      <div>
        <ol>
          {expanded.map((item: Vine[], itemIndex: number) => {

            return (
            <li key={itemIndex}
              className={`disjunction-${itemIndex}`}
              onMouseEnter={() => handleMouseEnter(item)}
              onMouseLeave={() => handleMouseLeave()}
            >
              <ul className="inline-list">
                {item.map((node: Vine, index: number) => (
                  <RenderNode node={node} dispatch={dispatch} key={node.id || index} />
                ))}
              </ul>
            </li>
          )})}
        </ol>
      </div>
    )
  }

export const RenderOriginal: React.FC<JustRoot> = ({ root, dispatch , highlightFlowNodes}) => {
  const excludeFill = {...excludeFill0, ...{hideShowOverride: HideShow.Collapsed}}
  const expanded = root.expand(excludeFill)
  return <RenderExpanded expanded={expanded} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes}  />

}

export const RenderSentences: React.FC<JustRoot> = ({ root, dispatch, highlightFlowNodes }) => {
  const expanded = root.expand(excludeFill0)
  return <RenderExpanded expanded={expanded} dispatch={dispatch} highlightFlowNodes={highlightFlowNodes}  />
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
        return eval(action.content) as Vine
      } else {
        return newRoot
      }
    default:
      return newRoot
  }
}
