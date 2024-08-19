import React from 'react';
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
import 'reactflow/dist/style.css';
import { MyAction } from '@/pages/docview';
import { Vine } from '@/woon';

type Props = {
  root : Vine,
  nodes ?: Node[],
  edges ?: Edge[],
  dispatch: React.Dispatch<MyAction>;
}

// when we talk about `root` here we are being inductive so it could really
// be any Vine, not just a Document.content
export const FlowInner : React.FC<Props> = ({root, dispatch}) => {
  const nodes = root.getFlowNodes({x:0, y:0})
  const edges = root.getFlowEdges()
  return <ReactFlow
  defaultNodes={nodes}
  defaultEdges={edges}
>
  <Controls />
  <Background />
</ReactFlow>
}

export const Flow : React.FC<Props> = ({root, dispatch}) => {
  return (
    <ReactFlowProvider>
    <div style={{ width: '100%', height: '500px' }}>
    <FlowInner root={root} dispatch={dispatch} />
    </div>
    </ReactFlowProvider>
  );
}
