import React, { useState } from 'react';
import { Vine, AnyAll, Any, All, Leaf, Fill, HideShow } from '@/woon';
import { Flow } from '@/pages/flow';

interface Props {
  doc: Document;
}
export interface Document {
  id: string;
  title: string;
  content: Vine;
}

export const RenderVine: React.FC<Props> = ({ doc }) => {
  const [expanded, setExpanded] = useState(false);
  const root = doc.content;
  // Render the tree visualization using a library of your choice
  // You can use the 'show' property to determine whether to render the node as expanded or collapsed
  // You can use the 'value' property to determine the state of the leaf nodes (true or false)
  return <div><p>tree render goes here</p></div>
};

export const RenderSentences: React.FC<Props> = ({ doc }) => {
  const root = doc.content;
  const expanded = doc.content.expand(
    (s:Vine) => { return (s instanceof Any && s.viz !== HideShow.Collapsed) },
    (p:Vine) => p instanceof Fill)

  const renderNode = (node: Vine) => {
    if (node instanceof Leaf) {
      return <li><b>{node.text}</b></li>;
    } else if (node instanceof Fill) {
      return <li>{node.fill}</li>;
    } else if (node instanceof AnyAll) {
      return <ul>
        ({node.c.map(renderNode)})
      </ul>;
    }
  };
  return (
    <div>
      <ol>
      {expanded.map((item: Vine[], itemIndex: number) => (
        <li key={itemIndex}>
          <ul className="inline-list">
          {item.map((node: Vine, index: number) => (
            <React.Fragment key={index}>
              {renderNode(node)}
            </React.Fragment>
          ))}
          </ul>
        </li>
      ))}
      </ol>
      <div>
        <textarea className="expandedContent" value={JSON.stringify(expanded, null, 2)} readOnly />
      </div>
    </div>
  );
}

export const DocView: React.FC<Props> = ({ doc }) => {
  const [expanded, setExpanded] = useState(false);
  const root = doc.content;

  const toggleExpandAll = () => {
    const traverseAndExpand = (node: Vine) => {
      if (node instanceof AnyAll) {
        node.viz = HideShow.Expanded;
        node.c.forEach(traverseAndExpand);
      }
    };

    traverseAndExpand(root);
    setExpanded(!expanded);
  };
  
  return <div>
      <button onClick={toggleExpandAll}>{expanded ? 'Collapse All' : 'Expand All'}</button>
      <h1>{doc.title}</h1>
      <RenderSentences doc={doc} />
      <div><Flow doc={doc} /></div>
      <textarea className="vineEditor" value={JSON.stringify(root, null, 2)} readOnly />
      <RenderVine doc={doc} />

    </div>
};

export default DocView;