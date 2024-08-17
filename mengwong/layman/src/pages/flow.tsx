import React, { useState, useEffect } from 'react';
import { useCallback } from 'react';
import ReactFlow, {
  MiniMap,
  Controls,
  Background,
  useNodesState,
  useEdgesState,
  addEdge,
} from 'reactflow';
import { Document } from '@/pages/docview'

import 'reactflow/dist/style.css';

type Props = {
  doc : Document
}

export const Flow : React.FC<Props> = ({doc}) => { //  : React.FC<Props> = ({ doc }) => {
  const [nodes, setNodes, onNodesChange] = useNodesState(doc.content.getFlowNodes({x:0, y:0}));
  const [edges, setEdges, onEdgesChange] = useEdgesState(doc.content.getFlowEdges());
  useEffect(() => {
    const root = doc.content
    setNodes(root.getFlowNodes({x:0, y:0}));
    setEdges(root.getFlowEdges());
  }, [doc]);


  console.log("nodes", nodes)
  console.log("edges", edges)

  const onConnect = useCallback((params) => setEdges((eds) => addEdge(params, eds)), [setEdges]);

  return (
    <div style={{ width: '100%', height: '500px' }}>
      <ReactFlow
        nodes={nodes}
        edges={edges}
        onNodesChange={onNodesChange}
        onEdgesChange={onEdgesChange}
        onConnect={onConnect}
      >
        <Controls />
        <Background />
      </ReactFlow>
    </div>
  );
}
