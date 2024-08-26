import React, { useCallback, useLayoutEffect } from 'react';
import { ReactFlowProvider, useReactFlow } from 'reactflow';
import ReactFlow, {
  MiniMap,
  Controls,
  Background,
  useNodesState,
  useEdgesState,
  Node,
  Edge, Connection,
  Panel,
  addEdge,
  Handle, Position,
} from 'reactflow';
import 'reactflow/dist/style.css';
import { MyAction } from '@/pages/docview';
import { Vine } from '@/woon';

type Props = {
  root : Vine,
  nodes : Node[],
  edges : Edge[],
  dispatch: React.Dispatch<MyAction>;
}


// some infrastructure for a connector node with no visible body or handles
const ConnectorNode: React.FC = () => {
  return (
    <div style={{ width: 1, height: 1 }}>
      <Handle
        type="target"
        position={Position.Left}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
      <Handle
        type="source"
        position={Position.Right}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
    </div>
  );
};

const InvisiHandles: React.FC<{data:{label:string}}> = ({data}) => {
  return (
    <div className="invisihandles-node">
      <Handle
        type="target"
        position={Position.Left}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
      <div>{data.label}</div>
      <Handle
        type="source"
        position={Position.Right}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
    </div>
  );
};

const nodeTypes = {
  connector: ConnectorNode,
  invisiHandles: InvisiHandles,
};


export const Flow: React.FC<Props> = ({ root, nodes, edges, dispatch }) => {
  return (
  <ReactFlowProvider>
  <ReactFlow key={`rf-${root.id}`} nodes={nodes} edges={edges} nodeTypes={nodeTypes}>
    <Controls />
  </ReactFlow>
  </ReactFlowProvider>
);
//   <LayoutFlow key={`layout-${root.id}`} root={root} initialNodes={nodes} initialEdges={edges} dispatch={dispatch} />

}
