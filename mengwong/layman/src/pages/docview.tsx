import React, { useState } from 'react';
import { Vine, Document, HideShow, AnyAll, canonicalizeToDNF } from '@/woon';


interface Props {
  doc: Document;
}

export const RenderVine: React.FC<Props> = ({ doc }) => {
  const [expanded, setExpanded] = useState(false);
  const root = doc.content;
  // Render the tree visualization using a library of your choice
  // You can use the 'show' property to determine whether to render the node as expanded or collapsed
  // You can use the 'value' property to determine the state of the leaf nodes (true or false)
  return <div><p>tree render goes here</p></div>
};

const joinElements = (elements:any[]) => {
  return elements.flatMap((el, index) => index === elements.length - 1 ? [el] : [el, " "]);
}


const RenderSentences: React.FC<{vine:Vine}> = ({vine}) => {
  // console.log("RenderSentences", vine);
  if (vine.type === 'leaf') {
    return <>{vine.text} </>
  }
  else if (vine.type == 'linear' && ! vine.children) {
    return <>{vine.text}</>
  }
  else if ((vine.type === 'linear' && vine.children) || vine.type === 'parent' && vine.anyAll === AnyAll.All) {
    return <>{vine.children?.map((child, index) => <RenderSentences key={index} vine={child} />)}</>
    // todo -- use joinElements
  }
  else if (vine.type === 'parent' && vine.anyAll === AnyAll.Any) {
    return <ul>{vine.children?.map((child, index) => <li key={index}> <RenderSentences key={index} vine={child} /></li>)}</ul>
  }
}


export const DocView: React.FC<Props> = ({ doc }) => {
  const [expanded, setExpanded] = useState(false);
  const root = doc.content;

  const toggleExpandAll = () => {
    const traverseAndExpand = (node: Vine) => {
      if (node.type === 'parent') {
        node.hideShow = HideShow.Expanded;
        node.children.forEach(traverseAndExpand);
      }
    };

    traverseAndExpand(root);
    setExpanded(!expanded);
  };
  
  return <div>
      <h1>{doc.title}</h1>
      <button onClick={toggleExpandAll}>{expanded ? 'Collapse All' : 'Expand All'}</button>

      <textarea className="vineEditor" value={JSON.stringify(root, null, 2)} readOnly />
      <RenderVine doc={doc} />
      <RenderSentences vine={canonicalizeToDNF(doc.content)} />

    </div>
};

export default DocView;