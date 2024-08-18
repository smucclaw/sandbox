import React, { useState, useReducer } from 'react';
import { Vine, AnyAll, Any, All, Leaf, Fill, HideShow } from '@/woon';
import { Flow } from '@/pages/flow';
import _ from 'lodash';

interface Props {
  doc: Document;
}

interface JustRoot {
  root: Vine;
  dispatch: MyDispatch;
}

type MyDispatch = React.Dispatch<MyAction>;

type MyAction = {
  type: string,
  nodeID ?: number,
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
  return <div><p>tree render goes here</p></div>
};

const excludeFill0 = {
  fParent: (s: Vine) => s instanceof Any && s.viz !== HideShow.Collapsed,
  fChild: (p: Vine) => p instanceof Fill
};

const RenderNode: React.FC<{ node: Vine, dispatch: MyDispatch }> = ({ node, dispatch }) => {
    if (node instanceof Leaf) {
      return <li><b>{node.text}</b></li>;
    } else if (node instanceof Fill) {
      return <li onClick={(e) => {
        console.log(`fill clicked ${node.id}, current viz is ${node.viz}`);
        e.stopPropagation(); // Prevent event bubbling
        dispatch({type:"toggleParent", nodeID:node.id})
      }}>{node.fill}</li>;
    } else if (node instanceof AnyAll) {
      return <ul>
        {node.c.map((value: Vine, index: number, array: Vine[]) => RenderNode({node: value, dispatch: dispatch}))}
      </ul>;
    }
  };

const RenderExpanded: React.FC<{expanded: Vine[][], dispatch: MyDispatch}> = ({ expanded, dispatch }) => {
  return (
    <div>
      <ol>
        {expanded.map((item: Vine[], itemIndex: number) => (
          <li key={itemIndex}>
            <ul className="inline-list">
              {item.map((node: Vine, index: number) => (
                <RenderNode node={node} dispatch={dispatch} key={node.id || index} />
              ))}
            </ul>
          </li>
        ))}
      </ol>
    </div>
  );
}  

export const RenderOriginal: React.FC<JustRoot> = ({ root, dispatch }) => {
  const excludeFill = {...excludeFill0, ...{hideShowOverride: HideShow.Collapsed}}
  const expanded = root.expand(excludeFill);
  console.log(`RenderOriginal: expanded`, expanded)
  return <RenderExpanded key="fromOriginal" expanded={expanded} dispatch={dispatch} />;
}

export const RenderSentences: React.FC<JustRoot> = ({ root, dispatch }) => {
  const expanded = root.expand(excludeFill0);
  return <RenderExpanded key="fromSentences" expanded={expanded} dispatch={dispatch} />;
}


export const DocView: React.FC<Props> = ({ doc }) => {
  const init = (initialContent:Vine) => _.cloneDeep(initialContent); // Initialize with a deep copy to avoid mutations
  const [root, dispatch] = useReducer(reducer, doc.content, init);
  const toggleExpandAll = () => {
    dispatch({type: root.viz !== HideShow.Collapsed ? 'COLLAPSE' : 'EXPAND'});
  };
  console.log(`DocView: root`, root)
  return (
    <div style={{ marginTop: '20px' }}>
      <h1>{doc.title}</h1>

      <div className="original"><h2>Original</h2>
      <RenderOriginal key={`${doc.title}-showOriginal`} root={root} dispatch={dispatch} />
      </div>
      
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2>Cases</h2>
        <button id="expansion" onClick={toggleExpandAll} style={{ marginLeft: 'auto' }}>
          {root.viz !== HideShow.Collapsed ? 'Expanded' : 'Collapsed'}
        </button>
      </div>
      <RenderSentences key={`${doc.title}-topLevel`} root={root} dispatch={dispatch} />

      <div><h2>Circuit Diagram</h2></div>
      <textarea className="vineEditor" value={JSON.stringify(root, null, 2)} readOnly />
      <RenderVine root={root} dispatch={dispatch} />
    </div>
  );
};

export default DocView;

function reducer(root: Vine, action: MyAction): Vine {
  console.log("reducer called with", action);
  const newRoot = _.cloneDeep(root)
  switch (action.type) {
    case 'EXPAND':
      newRoot.showAll(); return newRoot
    case 'COLLAPSE':
      newRoot.hideAll(); return newRoot
    case 'toggleParent':
      console.log(`handling toggleParent, nodeID=${action.nodeID}`);
      const toggleParentNode = (node: Vine) => {
        if (node.id === action.nodeID) {
          console.log(`toggling parent of ${node.id}`);
          node.toggleParent();
        } else if (node instanceof AnyAll) {
          node.c.forEach((childNode) => {
            toggleParentNode(childNode);
          });
        }
      };
      toggleParentNode(newRoot);
      return newRoot;
    default:
      return _.clone(root)
  }
}
