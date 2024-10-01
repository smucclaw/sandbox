import React, { useCallback, useEffect, useLayoutEffect, useMemo, useState } from 'react';
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
import { Vine, AnyAll, All, Any, Leaf, Fill, any } from '@/woon';

type Props = {
  root : Vine,
  nodes : Node[],
  edges : Edge[],
  dispatch: React.Dispatch<MyAction>,
  onNodeClick: (nodeId: string) => void,
  onNodesChange: (nodes: Node[]) => void,
  clickedNodes: (highlightedNodeIds: Set<string>) => void
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

const families = (root: Vine): (string | undefined)[][] => {
  const say = new Set(['or', 'either', 'whether'])

  const excludeFill: { fParent: (s: Vine) => boolean; fChild: (p: Vine) => boolean } = {
    fParent: (s: Vine) => s instanceof All || (s instanceof Any),
    fChild: (p: Vine) => (p instanceof Fill && say.has(p.fill)) || (p instanceof Leaf && say.has(p.text))
  }

  const expandedRoot = root.expand(excludeFill)
  return expandedRoot.map(innerArray =>
    innerArray.map(item => item.id?.toString())
  )
}

export const Flow: React.FC<Props> = ({root, nodes, edges, dispatch, onNodeClick, onNodesChange, clickedNodes }) => {
  const [reactFlowNodes, setReactFlowNodes] = useNodesState(nodes)
  const [flowEdges, setFlowEdges] = useEdgesState(edges)
  const disj = useMemo(() => families(root), [root])

  useEffect(() => {
    setReactFlowNodes(nodes)
  }, [nodes, setReactFlowNodes])

  useEffect(() => {
    onNodesChange(reactFlowNodes)
  }, [reactFlowNodes, onNodesChange])

  useEffect(() => {
    setFlowEdges(edges)
  }, [edges, setFlowEdges])

  const [highlightedNodeIds, setHighlightedNodeIds] = useState<Set<string>>(new Set())

  const handleNodeClick = useCallback(
    (event: React.MouseEvent, node: Node) => {
      const checkArrayExists = (disj: (string | undefined)[][], clicked: string[]): boolean => {
        return disj.some((arr: (string | undefined)[]) => {
          return clicked.every((id: string) => arr.includes(id))
        })
      }
  
      setHighlightedNodeIds(prevHighlighted => {
        const newHighlighted = new Set(prevHighlighted)
        const clickedArray = [node.id, ...Array.from(newHighlighted)].flat()
        const matchingArrays = Array.from(new Set(disj.filter(arr => arr.includes(node.id)).flat()))
        
        if (!checkArrayExists(disj, clickedArray)) {
          const idsToRemove = clickedArray.filter(id => !matchingArrays.includes(id))
          console.log("remove", idsToRemove)
          idsToRemove.forEach(id => newHighlighted.delete(id))
          newHighlighted.add(node.id)
        } else {
          if (newHighlighted.has(node.id)) {
            newHighlighted.delete(node.id)
          } else {
            newHighlighted.add(node.id)
          }
        }

        clickedNodes(newHighlighted)
  
        return newHighlighted
      })
  
      if (onNodeClick) {
        onNodeClick(node.id)
      }
    },
    [onNodeClick, disj, clickedNodes]
  )  

  useEffect(() => {
    setReactFlowNodes(prevNodes => {
      const updatedNodes = prevNodes.map(n => ({
        ...n,
        className: highlightedNodeIds.has(n.id) ? 'highlight' : ''
      }))
    
      return JSON.stringify(prevNodes) !== JSON.stringify(updatedNodes) ? updatedNodes : prevNodes
    })
    
    setFlowEdges(prevEdges => {
      const connectedEdges = prevEdges.filter(edge => {
        const isHighlighted = highlightedNodeIds.has(edge.source) || highlightedNodeIds.has(edge.target)
        return isHighlighted
      })
    
      const updatedEdges = prevEdges.map(edge => ({
        ...edge,
        style: {
          ...edge.style,
          stroke: connectedEdges.some(connectedEdge => connectedEdge.id === edge.id) ? 'lime' : 'black',
        }
      }))
    
      return JSON.stringify(prevEdges) !== JSON.stringify(updatedEdges) ? updatedEdges : prevEdges
    })

    clickedNodes(highlightedNodeIds)

  }, [highlightedNodeIds,setReactFlowNodes, setFlowEdges, clickedNodes])

  return (
  <ReactFlowProvider>
  <ReactFlow nodes={reactFlowNodes} edges={flowEdges} nodeTypes={nodeTypes} onNodeClick={handleNodeClick}>
    <Controls />
  </ReactFlow>
  </ReactFlowProvider>
);
//   <LayoutFlow key={`layout-${root.id}`} root={root} initialNodes={nodes} initialEdges={edges} dispatch={dispatch} />

}

export default Flow
