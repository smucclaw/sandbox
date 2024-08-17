import React, { useState, useCallback } from 'react';
import ReactFlow, { Background, Controls, Node, Edge } from 'reactflow';


type Label<T> = 
  | { type: 'Pre', value: T }
  | { type: 'PrePost', pre: T, post: T }
  | { type: 'Metadata', value: T };

  // Remove the duplicate definition of Default<T>

  type AndOr<T> = 
  | { type: 'And', items: T[] }
  | { type: 'Or', items: T[] }
  | { type: 'Neg', item: T }
  | { type: 'Simply', item: T };

  

  interface Q<T> {
    shouldView: 'View' | 'Hide' | 'Ask';
    andOr: AndOr<T>;
    prePost?: Label<T>;
    mark: Default<boolean>;
  }
  
  type QTree<T> = Tree<Q<T>>;

  interface BBox {
    width: number;
    height: number;
  }
  
  interface BoxedSVG {
    box: BBox;
    connect: Connect;
  }
  
  type Connect = boolean | null;

  function combineAnd(scale: Scale, elems: BoxedSVG[]): BoxedSVG {
    const myScale = getScale(scale);
    const leftPad = myScale.margins.leftMargin;
    const rightPad = myScale.margins.rightMargin;
  
    const { combinedBox, children } = elems.reduce((acc, elem) => {
      const updatedAcc = addElementToRow(acc, elem);
      return updatedAcc;
    }, { combinedBox: initialBox(), children: [] });
  
    combinedBox.width += leftPad + rightPad;
  
    return {
      box: combinedBox,
      connect: mergeConnectsFromChildren(children)
    };
  }
  
  function addElementToRow(current: BoxedSVG, next: BoxedSVG): BoxedSVG {
    // Logic to add the next element to the current row
    return updatedBoxedSVG;
  }
  
  function getScale(scale: Scale): Scale {
    // Logic to compute the scale for layout
    return scale;
  }
  
  function mergeConnectsFromChildren(children: BoxedSVG[]): Connect {
    // Logic to merge connection states from children
    return mergedConnect;
  }

  function move(offset: [number, number], elements: BoxedSVG[]): BoxedSVG[] {
    return elements.map(elem => {
      // Move each element by the offset
      return {
        ...elem,
        box: {
          ...elem.box,
          x: elem.box.x + offset[0],
          y: elem.box.y + offset[1],
        }
      };
    });
  }
  
  function vAlign(alignment: VerticalAlign, elements: BoxedSVG[]): BoxedSVG[] {
    // Perform vertical alignment of elements based on the alignment type
    return alignedElements;
  }
  
  type VerticalAlign = 'top' | 'middle' | 'bottom';

  function createAndNode(id: string, elements: BoxedSVG[], position: { x: number, y: number }): Node {
    const combined = combineAnd(scale, elements);
  
    return {
      id,
      type: 'default',
      data: { label: 'AND Gate' },
      position,
      style: {
        width: combined.box.width,
        height: combined.box.height,
      }
    };
  }

  function combineOr(scale: Scale, elems: BoxedSVG[]): BoxedSVG {
    const myScale = getScale(scale);
    const leftPad = myScale.margins.leftMargin;
    const rightPad = myScale.margins.rightMargin;
  
    const { combinedBox, children } = elems.reduce((acc, elem) => {
      const updatedAcc = addElementToColumn(acc, elem);
      return updatedAcc;
    }, { combinedBox: initialBox(), children: [] });
  
    combinedBox.width += leftPad + rightPad;
  
    return {
      box: combinedBox,
      connect: mergeConnectsFromChildren(children)
    };
  }
  
  function addElementToColumn(current: BoxedSVG, next: BoxedSVG): BoxedSVG {
    // Logic to add the next element to the current column
    return updatedBoxedSVG;
  }
  
  function hAlign(alignment: HorizontalAlign, elements: BoxedSVG[]): BoxedSVG[] {
    // Perform horizontal alignment of elements based on the alignment type
    return alignedElements;
  }
  
  type HorizontalAlign = 'left' | 'center' | 'right';

  interface NodeData {
    label: string;
    type: 'AND' | 'OR' | 'NOT';
  }
  
  function createGateNode(id: string, type: 'AND' | 'OR' | 'NOT', position: { x: number, y: number }): Node<NodeData> {
    return {
      id,
      type: 'default',
      data: { label: `${type} Gate`, type },
      position,
      style: {
        width: 100,
        height: 50,
      }
    };
  }

  interface EdgeData {
    sourceHandle?: string;
    targetHandle?: string;
  }
  
  function createWireEdge(source: string, target: string): Edge<EdgeData> {
    return {
      id: `edge-${source}-${target}`,
      source,
      target,
      type: 'default',
    };
  }

  function buildCircuit(circuit: QTree<any>, position: { x: number, y: number }): { nodes: Node[], edges: Edge[] } {
    const nodes: Node[] = [];
    const edges: Edge[] = [];
    let currentPosition = { ...position };
  
    function traverse(tree: QTree<any>, parentId?: string) {
      const nodeId = `node-${nodes.length}`;
      const nodeType = getNodeType(tree); // Determines if it's AND, OR, etc.
      const node = createGateNode(nodeId, nodeType, currentPosition);
      nodes.push(node);
  
      if (parentId) {
        const edge = createWireEdge(parentId, nodeId);
        edges.push(edge);
      }
  
      currentPosition.y += 100; // Move down for the next node
  
      // Recursively add children
      tree.children.forEach(child => traverse(child, nodeId));
    }
  
    traverse(circuit, undefined); // Start traversal from the root
  
    return { nodes, edges };
  }
  
  function getNodeType(tree: QTree<any>): 'AND' | 'OR' | 'NOT' {
    // Logic to determine the type of gate from the tree structure
    const { andOr } = tree.node;
    if (andOr.type === 'And') return 'AND';
    if (andOr.type === 'Or') return 'OR';
    if (andOr.type === 'Neg') return 'NOT';
    return 'AND'; // Default case
  }


function CircuitFlow({ circuit }: { circuit: QTree<any> }) {
  const { nodes, edges } = buildCircuit(circuit, { x: 0, y: 0 });

  return (
    <ReactFlow nodes={nodes} edges={edges}>
      <Background />
      <Controls />
    </ReactFlow>
  );
}

function getNodeStyle(type: 'AND' | 'OR' | 'NOT'): React.CSSProperties {
  switch (type) {
    case 'AND':
      return { border: '2px solid #0b5ed7', backgroundColor: '#e3f2fd', borderRadius: '50%' };
    case 'OR':
      return { border: '2px solid #28a745', backgroundColor: '#e9fbe5', borderRadius: '50%' };
    case 'NOT':
      return { border: '2px solid #ffc107', backgroundColor: '#fffbe5', borderRadius: '50%' };
    default:
      return {};
  }
}

function createGateNode(id: string, type: 'AND' | 'OR' | 'NOT', position: { x: number, y: number }): Node<NodeData> {
  return {
    id,
    type: 'default',
    data: { label: `${type} Gate`, type },
    position,
    style: {
      width: 100,
      height: 50,
      ...getNodeStyle(type), // Apply specific styles
    }
  };
}

function createGateNode(
  id: string,
  type: 'AND' | 'OR' | 'NOT',
  position: { x: number, y: number },
  onClick: (id: string) => void
): Node<NodeData> {
  return {
    id,
    type: 'default',
    data: {
      label: `${type} Gate`,
      type,
      onClick: () => onClick(id)  // Add click handler
    },
    position,
    style: {
      width: 100,
      height: 50,
      ...getNodeStyle(type),
    },
  };
}

import React, { useCallback } from 'react';
import ReactFlow, { Background, Controls, Node } from 'reactflow';

function CircuitFlow({ circuit }: { circuit: QTree<any> }) {
  const handleNodeClick = useCallback((id: string) => {
    console.log(`Node ${id} clicked`);
    // Add additional logic here (e.g., show modal, update state)
  }, []);

  const { nodes, edges } = buildCircuit(circuit, { x: 0, y: 0 }, handleNodeClick);

  return (
    <ReactFlow nodes={nodes} edges={edges}>
      <Background />
      <Controls />
    </ReactFlow>
  );
}

interface Scale {
  margins: {
    leftMargin: number;
    rightMargin: number;
  };
}

function getScale(scale: Scale): Scale {
  return scale;
}

function initialBox(): BBox {
  return { width: 100, height: 50 };
}

function move(offset: [number, number], elements: BoxedSVG[]): BoxedSVG[] {
  return elements.map(elem => {
    return {
      ...elem,
      box: {
        width: elem.box.width + offset[0],
        height: elem.box.height + offset[1]
      }
    };
  });
}

function vAlign(alignment: VerticalAlign, elements: BoxedSVG[]): BoxedSVG[] {
  // Perform vertical alignment based on alignment type
  return elements;
}

function hAlign(alignment: HorizontalAlign, elements: BoxedSVG[]): BoxedSVG[] {
  // Perform horizontal alignment based on alignment type
  return elements;
}


function CircuitFlow({ circuit }: { circuit: QTree<any> }) {
  const [nodes, setNodes] = useState<Node[]>([]);
  const [edges, setEdges] = useState<Edge[]>([]);

  const handleNodeClick = useCallback((id: string) => {
    console.log(`Node ${id} clicked`);
  }, []);

  useEffect(() => {
    const { nodes, edges } = buildCircuit(circuit, { x: 0, y: 0 }, handleNodeClick);
    setNodes(nodes);
    setEdges(edges);
  }, [circuit, handleNodeClick]);

  return (
    <ReactFlow nodes={nodes} edges={edges}>
      <Background />
      <Controls />
    </ReactFlow>
  );
}

export default CircuitFlow;