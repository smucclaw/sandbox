import React, { useCallback, useEffect, useLayoutEffect } from 'react';
import ELK from 'elkjs/lib/elk.bundled.js';
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
} from 'reactflow';
import { LayoutOptions, ElkExtendedEdge } from 'elkjs/lib/elk.bundled.js';
import 'reactflow/dist/style.css';
import { MyAction } from '@/pages/docview';
import { Vine } from '@/woon';

type Props = {
  root : Vine,
  nodes : Node[],
  edges : Edge[],
  dispatch: React.Dispatch<MyAction>;
}

const elk = new ELK();

// Elk has a *huge* amount of options to configure. To see everything you can
// tweak check out:
//
// - https://www.eclipse.org/elk/reference/algorithms.html
// - https://www.eclipse.org/elk/reference/options.html
const elkOptions:LayoutOptions = {
  'elk.algorithm': 'layered',
  'elk.layered.spacing.nodeNodeBetweenLayers': '100',
  'elk.spacing.nodeNode': '80',
};

const getLayoutedElements = (nodes:Node[], edges:Edge[], options:LayoutOptions = {}) => {
  const isHorizontal = options?.['elk.direction'] === 'RIGHT';
  const graph = {
    id: 'root',
    layoutOptions: options,
    children: nodes.map((node) => ({
      ...node,
      // Adjust the target and source handle positions based on the layout
      // direction.
      targetPosition: isHorizontal ? 'left' : 'top',
      sourcePosition: isHorizontal ? 'right' : 'bottom',

      // Hardcode a width and height for elk to use when layouting.
      width: 850,
      height: 500,
    })),
    edges: edges.map(e => { return {...e, sources:[e.source], targets:[e.target]} as ElkExtendedEdge }),
  };

  console.log(`layouted elements:`, graph)

  return elk
    .layout(graph)
    .then((layoutedGraph) => ({
      nodes: (layoutedGraph?.children == undefined ? [] : layoutedGraph.children).map((node) => ({
        ...node,
        // React Flow expects a position property on the node instead of `x`
        // and `y` fields.
        position: { x: node.x, y: node.y },
      })),

      edges: layoutedGraph.edges,
    }))
    .catch(console.error);
};

const LayoutFlow : React.FC<{root:Vine, initialNodes:Node[], initialEdges:Edge[], dispatch:React.Dispatch<MyAction>}>
  = ({root, initialNodes, initialEdges, dispatch}) => {
  const [nodes, setNodes, onNodesChange] = useNodesState(initialNodes)
  const [edges, setEdges, onEdgesChange] = useEdgesState(initialEdges)
  const { fitView } = useReactFlow();

  const onConnect = useCallback(
    (params:Edge|Connection) => setEdges((eds) => addEdge(params, eds)),
    [],
  );
  const onLayout = useCallback(
    ({ direction = "RIGHT", useInitialNodes = false }) => {
      const opts = { 'elk.direction': direction, ...elkOptions };
      const ns = useInitialNodes ? initialNodes : nodes;
      const es = useInitialNodes ? initialEdges : edges;

      getLayoutedElements(ns, es, opts).then(
        ({ nodes: layoutedNodes = [], edges: layoutedEdges = [] }) => {
          setNodes(layoutedNodes);
          setEdges(layoutedEdges);

          window.requestAnimationFrame(() => fitView());
        },
      );
    },
    [nodes, edges],
  );

  // Calculate the initial layout on mount.
  useLayoutEffect(() => {
    onLayout({ direction: 'RIGHT', useInitialNodes: true });
  }, []);

  return (
    <div style={{ width: '100%', height: '600px' }}>
      <ReactFlow
        nodes={nodes}
        edges={edges}
        onConnect={onConnect}
        onNodesChange={onNodesChange}
        onEdgesChange={onEdgesChange}
        fitView
      >
        <Panel position="top-right">
          <button onClick={() => onLayout({ direction: 'DOWN' })}>
            vertical layout
          </button>
  
          <button onClick={() => onLayout({ direction: 'RIGHT' })}>
            horizontal layout
          </button>
        </Panel>
      </ReactFlow>
    </div>
  );
}

export const Flow: React.FC<Props> = ({ root, nodes, edges, dispatch }) => {
  const [reactFlowNodes, setReactFlowNodes] = useNodesState(nodes)
  console.log('nodes:', nodes, root);

  useEffect(() => {
    setReactFlowNodes(nodes);
  }, [nodes]);

  return (
    <ReactFlowProvider>
      <ReactFlow key={`rf-${root.id}`} nodes={reactFlowNodes} edges={edges} />
    </ReactFlowProvider>
  )
//   <LayoutFlow key={`layout-${root.id}`} root={root} initialNodes={nodes} initialEdges={edges} dispatch={dispatch} />

}
