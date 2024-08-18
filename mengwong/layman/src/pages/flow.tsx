import React, { useState, useEffect } from 'react';
import { ReactFlowProvider, useReactFlow } from 'reactflow';
import ReactFlow, {
  MiniMap,
  Controls,
  Background,
  useNodesState,
  useEdgesState,
  Node,
  Edge,
} from 'reactflow';
import { Document } from '@/pages/docview'

import 'reactflow/dist/style.css';

type Props = {
  doc : Document,
  nodes ?: Node[],
  edges ?: Edge[]
}

export const FlowInner : React.FC<Props> = ({doc}) => {
  const [nodes, setNodes, onNodesChange] = useNodesState<Node[]>(doc.content.getFlowNodes({x:0, y:0}));
  const [edges, setEdges, onEdgesChange] = useEdgesState<Edge[]>(doc.content.getFlowEdges());
  useEffect(() => {
    // all this react stuff is madness
    console.log("doc has changed:", doc);
    console.log(`1: nodes has ${nodes.length} elements`);
    const freshNodes = doc.content.getFlowNodes({x:0, y:0})
    console.log(`freshNodes has ${freshNodes.length} elements`);
    setNodes(freshNodes)
    console.log(`2: nodes has ${nodes.length} elements`);
  }, [doc]);
  return <ReactFlow
  nodes={nodes}
  edges={edges}
  onNodesChange={onNodesChange}
  onEdgesChange={onEdgesChange}
>
  <Controls />
  <Background />
</ReactFlow>
}

export const Flow : React.FC<Props> = ({doc}) => {
  return (
    <ReactFlowProvider>
    <div style={{ width: '100%', height: '500px' }}>
    <FlowInner doc={doc} />
    </div>
    </ReactFlowProvider>
  );
}
