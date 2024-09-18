import React, { useCallback, useEffect, useLayoutEffect, useState } from 'react';
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
  dispatch: React.Dispatch<MyAction>,
  onNodeClick: (nodeId: string) => void,
  onNodesChange: (nodes: Node[]) => void
}

// some infrastructure for a connector node with no visible body or handles
const ConnectorLeft: React.FC = () => {
  return (
    <div style={{ width: 1, height: 1 }}>
      <Handle
        type="target"
        position={Position.Right}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
      <Handle
        type="source"
        position={Position.Left}
        style={{ opacity: 0, width: 1, height: 1 }}
        isConnectable={true}
      />
    </div>
  );
};
// some infrastructure for a connector node with no visible body or handles
const ConnectorRight: React.FC = () => {
  return (
    <div style={{ width: 1, height: 1 }}>
      <Handle
        type="target"
        position={Position.Left}
        style={{ opacity: 0, width: 1, height: 1, inset: 0, border: 0 }}
        isConnectable={true}
      />
      <Handle
        type="source"
        position={Position.Right}
        style={{ opacity: 0, width: 1, height: 1, inset: 0, border: 0 }}
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
  connectorL: ConnectorLeft,
  connectorR: ConnectorRight,
  invisiHandles: InvisiHandles,
};


export const Flow: React.FC<Props> = ({ root, nodes, edges, dispatch, onNodeClick, onNodesChange }) => {
  const [reactFlowNodes, setReactFlowNodes] = useNodesState(nodes)
  const [highlightedNodeId, setHighlightedNodeId] = useState<string | null>(null)

  console.log('nodes:', nodes, root)

  useEffect(() => {
    setReactFlowNodes(nodes)
  }, [nodes, setReactFlowNodes])

  useEffect(() => {
    onNodesChange(reactFlowNodes)
  }, [reactFlowNodes, onNodesChange])


  const [highlightedNodeIds, setHighlightedNodeIds] = useState<string[]>([])
  const handleNodeClick = useCallback((event: React.MouseEvent, node: Node) => {
    setReactFlowNodes(prevNodes => {
      const highlightedNodesSet = new Set<string>(highlightedNodeIds)
  
      if (highlightedNodesSet.has(node.id)) {
        highlightedNodesSet.delete(node.id)
      } else {
        highlightedNodesSet.add(node.id)
      }
  
      const newHighlightedNodeIds = Array.from(highlightedNodesSet)
  
      const updatedNodes = prevNodes.map(n => ({
        ...n,
        className: newHighlightedNodeIds.includes(n.id) ? 'highlight' : ''
      }))
  
      return updatedNodes
    })
  
    setHighlightedNodeIds(prev => {
      const updatedSet = new Set(prev)
      if (updatedSet.has(node.id)) {
        updatedSet.delete(node.id)
      } else {
        updatedSet.add(node.id)
      }
      return Array.from(updatedSet)
    })
  
    onNodeClick(node.id)
  }, [highlightedNodeIds, onNodeClick, setReactFlowNodes])
  
  return (
  <ReactFlowProvider>
  <ReactFlow key={`rf-${root.id}`} nodes={reactFlowNodes} edges={edges} nodeTypes={nodeTypes}onNodeClick={handleNodeClick}>
    <Controls />
  </ReactFlow>
  </ReactFlowProvider>
);
//   <LayoutFlow key={`layout-${root.id}`} root={root} initialNodes={nodes} initialEdges={edges} dispatch={dispatch} />

}

export default Flow
