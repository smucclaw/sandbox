import _ from "lodash"
import 'lodash.product';
import { Node, Edge, XYPosition, Position, Handle, NodeProps } from 'reactflow'
import React, { Fragment, useCallback } from 'react';



// Expansion from a BoolStruct to a DNF (Disjunctive Normal Form):
// We traverse the BoolStruct, depth-first, flattening the BoolStruct to a list of lists -- a sum of products.
// A three-element OR list (a OR b OR c) looks like:
// [ [ 'a' ], [ 'b' ], [ 'c' ] ]
//
// A three-element AND list (a AND b AND c) looks like:
// [ [ 'a', 'b', 'c' ] ]
//
// Recursive expansion consists of combining child lists to always maintain a sum of products.
// When ANDing, we take the cartesian product of the lists.
// When ORing, we simply concatenate the sum of products.

// this utility function uses the _.product function to achieve both of the above rewrites.
// we use it for both AND and OR operations, tweaking the call syntax to produce the desired result.
function xprod <T>(...l: T[][][]) : T[][] {                ; // console.log(`** xprod: `, JSON.stringify(l));
  const product = _.product(...l);                         ; // console.log(`p2: `, JSON.stringify(product,null,2,));
  const flattened = [product.map(s => s.flat(1))].flat(1)  ; // console.log(`f3: `, flattened);
  return flattened
}

let idMax = 1
interface ExpansionOpts {
  fParent           : (_v:Vine) => boolean;
  fChild            : (_v:Vine) => boolean;
  hideShowOverride ?: HideShow;
}

const defaultExpansionOpts : ExpansionOpts = {
  fParent: _.constant(false),
  fChild:  _.constant(false)
}

const [xMargin, yMargin] = [40,20]

export class Vine { // your basic tree, with AnyAll leaves, and Leaf/Fill terminals.
  toggleParent () {}
  constructor(
    public viz  ?: HideShow,
    public   id ?: number,
    public className?: string,
  ) {
    this.id = id ?? idMax++;
  }
  expand(_:ExpansionOpts): Vine[][] { return [[this]] } // runtime environment reader monad used by Original
   // takes two filter functions; first applied to the parent, the second to be applied to the children.
   // will exclude children where both functions return true.
   // the sentence rendering code uses this to hide "or" fillers since those don't belong in the sentence.
  getFlowNodes(_newPos:XYPosition,_parentId?:string) : Node[] { return [] }
  getFlowEdges() : Edge[] { return [] }
  hideAll() { this.viz = HideShow.Collapsed; }
  showAll() { this.viz = HideShow.Expanded;  }
  toggleViz(newViz:HideShow) {
    console.log(`${this.id} before toggle = ${this.viz}`)
    this.viz = newViz
    console.log(`${this.id} toggled to ${this.viz}`)
   }
  recordParent(p:Vine) : Vine {
     this.toggleParent = () => { const newViz = p.viz === HideShow.Collapsed ? HideShow.Expanded : HideShow.Collapsed;
     console.log(`${this.id} running toggleParent on ${p.id}, should set to ${newViz}`);
      p.toggleViz(newViz) };
      return this
     }
  clone() { return new Vine(this.viz, this.id) }
  isFullyExpanded() : boolean { return this.viz === HideShow.Expanded }
}

export class AnyAll extends Vine {
  constructor(
    public c : Vine[],
    viz ?: HideShow,
    id  ?: number,
  ) {
    super(viz, id);
    for (const child of c) {
      child.recordParent(this)
    }
  }
  expand(exOpts : ExpansionOpts) : Vine[][] {
    // console.log(`* ${this.id} expand() starting`, this);
    if (exOpts.hideShowOverride !== undefined) {
      if (exOpts.hideShowOverride === HideShow.Collapsed) {
        // console.log(`overriding := collapse for ${this.id}`);
        return xprod(... this.c.map(x => x.expand(exOpts)))         // All-style merge
      } else if (exOpts.hideShowOverride === HideShow.Expanded) {
        // console.log(`overriding := expanded for ${this.id}, calling native merge`);
        return this.merge(... this.c.map(x => x.expand(exOpts)))    // Any-style merge
      }
    }
    if (this?.viz === HideShow.Collapsed) {
      // console.log(`${this.id} this.viz is collapsed, doing All-style merge`);
         return xprod(... this.c.map(x => x.expand(exOpts)))        // All-style merge
        }
    // console.log(`${this.id} this.viz is not collapsed, so doing native merge`);
    const merged = this.merge(...(this.c
                                    .filter(ch => ! (exOpts.fParent(this) && exOpts.fChild(ch)))
                                    .map( c => c.expand(exOpts))))
    return merged
  }
  merge<T>(...l:Vine[][][]) : Vine[][] { return [] }
  hideAll() { super.hideAll(); this.c.forEach(x => x.hideAll()) }
  showAll() { super.showAll(); this.c.forEach(x => x.showAll()) }
  isFullyExpanded() : boolean { return this.viz === HideShow.Expanded
     && this.c.filter( x=> isAny(x) || isAll(x))
       .every(x => x.isFullyExpanded()) }


 }

export class All extends AnyAll {
  merge (...l:Vine[][][]) : Vine[][] { // console.log("* doing All merge");
   // console.log(`** All ${this.id} merge, collapsed`);
   return xprod(...l)
  }
  getFlowNodes(relPos:XYPosition, parentId: string) : Node[] {
    console.log(`** All ${this.id} getFlowNodes given ${JSON.stringify(relPos)}`, this);
    const childFlowNodes :Node[] = []
    // iteratively build the childFlowNodes. Each child will have its own size, which is not known until we call getFlowNodes on it.
    // The position argument which we pass to each child's getFlowNodes is dependent on the sum of the children before it.
         
    this.c.forEach((x,i) => {
      // we calculate the latest x position as the maximum of the children's x positions and their width.
      // the y position for a new child is always 0 because we are stacking the children horizontally.
      // we pass these as the position argument to the next child.
      //  const maxX = Math.max(...childFlowNodes.map(node => node.position.x + (node.style?.width as number) ?? 0), 0) // thanks, JS, max [] gives -Infinity wtf
      // wrap 'as number' in ()
      // so when node.style?.width is undefined, we use 0. otherwise it becomes undefined and never becomes 0
       const maxX = Math.max(...childFlowNodes.map(node => (node.position.x + ((node.style?.width as number) ?? 0))), 0)

       const childNode = x.getFlowNodes({ x: maxX + xMargin, y: yMargin}, `${this.id}-group`); // bounding box left margin
       childFlowNodes.push(...childNode)
    })

    console.log(`** All ${this.id} getFlowNodes done constructing childFlowNodes`, childFlowNodes);

    const [bboxWidth, bboxHeight] = [Math.max(...childFlowNodes.map(node => node.position.x + (node.style?.width  as number) || 0), 0) + xMargin, // bounding box right margin
                                     Math.max(...childFlowNodes.map(node => node.position.y + (node.style?.height as number) || 0), 0) + xMargin] // bounding box bottom margin?

    // the infrastructure for the child nodes consists of the parent group node, an in-node living in the left margin, and an out-node living in the right margin.
    const nodes : Node[] = [
      { // GROUP: the hypernode group
       id: `${this.id}-group`,
       type: 'group',
       position: relPos,
	sourcePosition: Position.Right, targetPosition: Position.Left,
	data: {},
       style: {
        width:  bboxWidth,//+ xMargin,
        height: bboxHeight,
        border: 'none',
      },
       parentId: parentId
      },
      { // IN: a pseudo-node which is basically a tiny little circle which acts as a lead-in to the children in the group
        id: `${this.id}-in`,
        type: 'connectorR',
	data: {},
        position: {x: 0, y: bboxHeight / 2 + 15 },
        parentId: `${this.id}-group`,
        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: { width: 1, height: 1 },
      },
      { // OUT: a pseudo-node which is basically a tiny little circle which acts as a lead-out to the children in the group
        id: `${this.id}-out`,
        type: 'connectorR',
	data: {},
        position: {x: bboxWidth - 22, y: bboxHeight / 2 + 15 },
        sourcePosition: Position.Right, targetPosition: Position.Left,
        parentId: `${this.id}-group`,
        style: { width: 1, height: 1 },
      },
      ...childFlowNodes
     ]
    // now that we know the bounding box of the group, we can re-layout the children
    nodes.slice(3).forEach(node => {
      if (node.parentId != `${this.id}-group`) { return }
      console.log(`** All ${this.id} repositioning ${node.id}, previously ${JSON.stringify(node.position)}`);
      node.position.y = (bboxHeight - Number(node.style?.height)) / 2 + yMargin
      console.log(`** All ${this.id} repositioned ${node.id} to ${JSON.stringify(node.position)}`);
    })

    console.log(`** All ${this.id} getFlowNodes`, nodes);
    return nodes
   }
   getFlowEdges() : Edge[] {
    // we connect ourselves to our first child, and the children to each other in sequence.
    // this will probably change when we figure out subflows.
    const lastChild : Vine = this.c[this.c.length - 1]
    const edges = _.flatten([
      { id: `e${this.id}-${this.c[0].id}-firstchildOfAll`, source: `${this.id}-in`, target: (isAny(this.c[0]) || isAll(this.c[0]) ? `${this.c[0].id}-in` : `${this.c[0].id}`),  style: { stroke: 'black', strokeWidth: 4 }, },
      { id: `e${this.id}-${lastChild.id}-lastchildOfAll`, target: `${this.id}-out`, source: (isAny(lastChild) || isAll(lastChild)) ? `${lastChild.id}-out` : `${lastChild.id}`,  style: { stroke: 'black', strokeWidth: 4 }, },
      ...(this.c.slice(0, -1).flatMap((n,i) => [{ id: `e${n.id}-${this.c[i+1].id}`, source: (isAny(n) || isAll(n) ? `${n.id}-out` : `${n.id}`),
                target: (isAny(this.c[i+1]) || isAll(this.c[i+1]) ? `${this.c[i+1].id}-in` : `${this.c[i+1].id}`),
                  style: { stroke: 'black', strokeWidth: 4 },},
                           ...n.getFlowEdges()])),
       lastChild.getFlowEdges()
    ])
    console.log(`** All ${this.id} getFlowEdges`, edges);
    console.log(`All originally`, this)
    return edges
   }
   clone() { return new All(this.c.map(x => x.clone()), this.viz, this.id) }
  }
// const initialEdges = [{ id: 'e1-2', source: '1', target: '2' }];


export class Any extends AnyAll {
  merge (...l:Vine[][][]) : Vine[][] {    // console.log("* doing Any merge");
    // we use this mechanism to exclude any top-level elements which are only Fill nodes from the sentence rendering,
    // but we don't want to exclude them from the flowchart rendering.
    // console.log(`* Any ${this.id} merge, should be expanding`);
    return xprod(l.flat(1))
  }
  getFlowNodes(relPos:XYPosition, parentId?: string) : Node[] {
    console.log(`** Any ${this.id} getFlowNodes given ${JSON.stringify(relPos)}`, this);
    const childFlowNodes :Node[] = []
    // iteratively build the childFlowNodes. Each child will have its own size, which is not known until we call getFlowNodes on it.
    // The position argument which we pass to each child's getFlowNodes is dependent on the sum of the children before it.
         
    this.c.forEach((x,i) => {
      // we calculate the latest y position as the maximum of the children's y positions and their height
      // the x position for a new child is always 0 (well, 20, for a left margin) because we are stacking the children vertically.
      // we pass these as the position argument to the next child.
      const maxY = Math.max(...childFlowNodes.map(node => node.position.y + ((node.style?.height as number) ?? 0)), 0)
      const childNode = x.getFlowNodes({ x: 0, y: maxY + 20}, `${this.id}-group`); // x=20, bounding box left margin
       childFlowNodes.push(...childNode);
       console.log(`*** Any child: `, childNode)
    })
    console.log(`** Any ${this.id} getFlowNodes done constructing childFlowNodes`, childFlowNodes);

    const [bboxWidth, bboxHeight] = [Math.max(...childFlowNodes.map(node => node.position.x + (node.style?.width  as number) || 0), 0)  + xMargin, // bounding box right margin
                                     Math.max(...childFlowNodes.map(node => node.position.y + (node.style?.height as number) || 0), 0)  + yMargin] // bounding box bottom margin?)
    console.log(`bboxWidth = ${bboxWidth}, bboxHeight = ${bboxHeight}`)
    // the infrastructure for the child nodes consists of the parent group node, an in-node living in the left margin, and an out-node living in the right margin.
    const nodes = [
      { // GROUP: the hypernode group
       id: `${this.id}-group`,
       type: 'group',
       data: { label: `any` },
       position: relPos,
       sourcePosition: Position.Right, targetPosition: Position.Left,
       style: {
        width:  bboxWidth,
        height: bboxHeight,
        border: 'none',
      },
       parentId: parentId
      },
      { // IN: a pseudo-node which is basically a tiny little circle which acts as a lead-in to the children in the group
        id: `${this.id}-in`,
        type: 'connectorR',
        data: { },
        position: {x: -12, y: bboxHeight / 2 - 10}, // if/when we allow switchin between vertical and horizontal layouts this will have to change
        parentId: `${this.id}-group`,
        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: { width: 1, height: 1 },
      },
      { // OUT: a pseudo-node which is basically a tiny little circle which acts as a lead-out to the children in the group
        id: `${this.id}-out`,
        type: 'connectorR',
        data: { },
        position: {x: bboxWidth + 15, y: bboxHeight / 2 - 10},
        sourcePosition: Position.Right, targetPosition: Position.Left,
        parentId: `${this.id}-group`,
        style: { width: 1, height: 1 },
      },
      ...childFlowNodes
    ]
    // now that we know the bounding box of the group, we can re-layout the children
    nodes.slice(3).forEach(node => {
      if (node.parentId != `${this.id}-group`) { return }
      console.log(`** Any ${this.id} repositioning ${node.id}, previously ${JSON.stringify(node.position)}`);
      node.position.x = (bboxWidth - Number(node.style?.width)) / 2
      console.log(`** Any ${this.id} repositioned ${node.id} to ${JSON.stringify(node.position)}`);
    })
    
    console.log(`** Any ${this.id} getFlowNodes`, nodes);
    return nodes
  }
  getFlowEdges() : Edge[] {
    // we connect ourselves to all the children in parallel
    const edges = this.c.flatMap((n,i) => [
      { id: `e${this.id}-${n.id}-in`,  source: `${this.id}-in`, target: (isAll(n) || isAny(n)) ? `${n.id}-in` : String(n.id),     style: { stroke: isFill(n) ?'none':"black", strokeWidth: 4 },   },
      { id: `e${this.id}-${n.id}-out`, source: (isAll(n) || isAny(n)) ? `${n.id}-out` : String(n.id), target: `${this.id}-out`,    style: { stroke: isFill(n) ?'none':"black", strokeWidth: 4 }, },
      ...(n.getFlowEdges())])

    console.log(`** Any ${this.id} getFlowEdges`, edges);
    console.log(`Any originally`, this)
    return edges
  }
  clone() { return new Any(this.c.map(x => x.clone()), this.viz, this.id) }
}
  
// ground terms which can take boolean values
export class Leaf extends Vine {
  constructor(
    public text     : string,
    public value   ?: boolean,
    public dflt    ?: boolean,
    viz  ?: HideShow,
    id   ?: number,
  ) { super(viz,id) }
  getFlowNodes(relPos:XYPosition, parentId ?: string) : Node[] {
    console.log(`** Leaf ${this.id} getFlowNodes ${JSON.stringify(relPos)}`, this)
    const node : Node = {
      id: `${this.id}`,
      type: 'default',
      data: {
        label: this.text,
      },
      position: relPos,
      sourcePosition: Position.Right, targetPosition: Position.Left,
      style: {
      width: 150,
      height: Math.max(40, this.text.length * 1.6), // Ensure a minimum height of 40
      backgroundColor: this.value == undefined ? "white" : this.value ? "green" : "red"
      }
    }
    
    if (parentId !== undefined) { node.parentId = parentId }
    return [ node ]
  }

  clone() { return new Leaf(this.text, this.value, this.dflt, this.viz, this.id) }
}

// non-ground-terms, just inert bits of text needed for grammatical comprehensibility. This replaces the Pre / PrePost from AnyAll
export class Fill extends Vine {
  constructor(
    public fill     : string,
    viz  ?: HideShow,
    id      ?: number,
  ) { super(viz,id) }
  getFlowNodes(relPos:XYPosition, parentId ?: string) : Node[] {
    console.log(`** Fill ${this.id} getFlowNodes ${JSON.stringify(relPos)}`, this);
    const node : Node = {
      id: `${this.id}`,
      type: 'invisiHandles',
      data: { label: this.fill },
      position: relPos,
      sourcePosition: Position.Right, targetPosition: Position.Left,
      style: {
        width: 100,
        height: 40,
        border: "none",
        background: "transparent",
      },
  }
    if (parentId !== undefined) { node.parentId = parentId }
    return [ node ]

  }
  clone() { return new Fill(this.fill, this.viz, this.id) }
}

const isAll    = (v: Vine) => v instanceof All
const isAny    = (v: Vine) => v instanceof Any
const isNot    = (v: Vine) => v instanceof Not
const isLeaf   = (v: Vine) => v instanceof Leaf
const isFill   = (v: Vine) => v instanceof Fill

enum A {
  ny, // disjunctive list
  ll, // conjunctive list
}

export class Not extends Vine {
  constructor(
    public c : Vine,
    viz ?: HideShow,
    id  ?: number) {
    super(viz, id);
    c.recordParent(this)
  }
  expand(exOpts : ExpansionOpts) : Vine[][] {
    const merged = this.c.expand(exOpts)
    return merged
  }
  getFlowNodes(relPos:XYPosition, parentId: string) : Node[] {
    const childFlowNodes : Node[] = this.c.getFlowNodes({ x: xMargin, y: 0 }, `${this.id}-group`);

    // [TODO] same treatment as Any/All, except there is always only one child logically though there may be mulitple physically.
    // the first element of childFlowNodes should be the group, or the singleton leaf, so we use that.

    const nodes = [
      { // GROUP: the hypernode group
       id: `${this.id}-group`,
       type: 'group',
       data: { label: `not` },
       position: relPos,
       style: {
        width: childFlowNodes[0].style?.width || 99 + xMargin,
        height: childFlowNodes[0].style?.height || 99 + yMargin,
       },
       sourcePosition: Position.Right, targetPosition: Position.Left,
      },
      { // IN
        id: `${this.id}-in`,
        type: 'default',
        data: { label: `not` },
        position: { x: 5, y: Number(childFlowNodes[0]?.style?.height || 99) / 2 - 10},
        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: {
          width: 5,
          height: 5,
          borderRadius: "50%",
          backgroundColor: "red"
        },
      },
      { // OUT
        id: `${this.id}-out`,
        type: 'default',
        data: { label: `not` },
        // use ?? instead of || so fallback is used when null/undefined
        position: {
          x: Number(childFlowNodes[0].style?.width ?? 99),
          y: (Number(childFlowNodes[0].style?.height ?? 99) / 2) - 10
        },        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: {
          width: 5,
          height: 5,
          borderRadius: "50%",
          backgroundColor: "red"
        },
      },
      ...childFlowNodes
     ]
     this.assignParentGroup(nodes);

    console.log(`** Not ${this.id} getFlowNodes`, nodes);
    return nodes
   }
   assignParentGroup(nodes:Node[]) {
    console.log(`** ${this.id} assignParentGroup`);
    nodes.forEach(node => {
      if (`${this.c.id}` === node.id || `${this.c.id}-group` === node.id) {
        node.parentId = `${this.id}-group`;
        node.extent = 'parent'
        console.log(`** ${this.id} assignParentGroup assigned ${node.id} to parent ${this.id}-group`);
      }
    });
  }

   getFlowEdges() : Edge[] {
    // we connect ourselves to our (only) child
    const edges = _.flatten([
      { id: `e${this.id}-${this.c.id}-childOfNot`, source: `${this.id}`, target: `${this.c.id}` },
      ...this.c.getFlowEdges()
    ])
    console.log(`** Not ${this.id} getFlowEdges`, edges);
    return edges
   }
   clone() { return new Not(this.c.clone(), this.viz, this.id) }
}


// this isn't really HideShow it's more of a fold / unfold, collapse / expand.
// when an Any node is expanded, the DNF shows each of its children in parallel.
// when an Any node is collapsed, the DNF shows the Any node on a single line, basically like an All node.
export enum HideShow {
  Expanded = "expanded", Collapsed = "collapsed"
}

export const mustSing =
  com( // all
    say("... who"),
    ele("walks"),
    say("and"),
    any( 
      ele("drinks"),
      say("or"),
      ele("eats"),
    )
  );

export function all (...l:Vine[]) : All { return new All(l) } // conjunction
export function any (...l:Vine[]) : Any { return new Any(l) } // disjunction
export function com (...l:Vine[]) : All { return new All(l) } // compound
export function not (l:Vine)      : Not { return new Not(l) }  // negation
export function ele (l:string)    : Leaf { return new Leaf(l) }  // element
export function say (l:string)    : Fill { return new Fill(l) }  // filler

export const narnia = com(
  say('there is'),
  all(
    any(
      ele('a grumpy head'),
      say('or'),
      ele('an unkind heart'),
    ),
    say('and'),
    any(
      ele('a bloody fist'),
      say('or'),
      all(
        ele('a venomous'),
        any(ele('claw'), say('or'), ele('tooth'))
      )
    ),
  ),
)

export const cheating_tautology =
  com(say('whether'),
      say('such deception'),
      any(ele('was'),
	  say('or'),
	  ele('was not')
	 ),
      say('the'),
      any(ele('sole'), say('or'), ele('main')),
      say('inducement')
     )

// Whoever cheats and thereby dishonestly induces the person deceived
// to deliver or cause the delivery of any property to any person, or
// to make, alter or destroy the whole or any part of a valuable
// security, or anything which is signed or sealed, and which is
// capable of being converted into a valuable security, shall be
// punished with imprisonment for a term which may extend to 10 years,
// and shall also be liable to fine.

export const marijuana =
  all(say("whoever"),
    ele("cheats"),
    say("and"),
    ele("thereby dishonestly induces"),
    say("the person deceived to"),
    any(
      com(
        any(
          ele("deliver"),
          say("or"),
          ele("cause the delivery of")),
        say("any property"),
        say("to any person"),
        say("or to")),
      all(
        any(ele("make"),
          ele("alter"), say("or"),
          ele("destroy")
        ),
        any(ele("the whole of"),
          say("or"),
          ele("any part of"),
          any(ele("a valuable security"),
            say("or"),
            all(
              any(ele("anything signed"),
                ele("anything sealed")),
              say("and which is"),
              ele("capable of being converted into a valuable security")
            ))))))
    
export const cheating = 
all(
  com(say('by'), ele('deceiving'), say('any person')),
  // cheating_tautology,
  any(all(any(ele('fraudulently'),
	      say('or'),
	      ele('dishonestly')),
	  say('induces the person so deceived'),
	  com(say('to'),
	      any(
		all(
		  any(ele('deliver'),
		      say('or'),
		      ele('cause the delivery of')),
		  say('any property to any person')),
		say('or'),
		ele('consent that any person shall retain any property,'))
	     ),
	 ),
      say('or'),
      com(ele('intentionally'),
	  say('induces the person so deceived to'),
	  all(com(any(ele('do anything which he would not do'),
		      say('or'),
		      ele('not do anything which he would do')),
		  say('if he were not so deceived')
		 ),
	      say('and'),
	      com(say('which act or omission'),
		  any(ele('causes'),
		      say('or'),
		      ele('is likely to cause')),
		  any(ele('damage or harm')
		     ),
		  say('to any person in'),
		  any(ele('body'),
		      ele('mind'),
		      ele('reputation'),
		      say('or'),
		      ele('property')
		     )
		 )
	     )
	 )
     )
)

export const laymanS =
  com(
    all(ele('S2'),
	any(
          all(ele('S3'),ele('S4'),
              any(ele('S5'),
		  all(ele('S6'),ele('S7'))
		 )
             ),
          all(ele('S8'),ele('S9'))
        )
       )
  )

export const abcde_text =
`
 any(all(ele('a'),ele('b')),
      all(ele('c'),ele('d'),ele('e'))
  )
`

export const abcde = eval(abcde_text)

// to do: add functionality to allow ele('e') to expand, by substitution, to not(ele('c'))
// and do some interesting logic based on that using Espresso


if (require.main === module) {
  const expanded = narnia.expand(defaultExpansionOpts);
  // console.log("* narnia")
  // console.log(expanded);
}


// const c2s =
// new All([
//   new Leaf("c2a"),
//   new Leaf("c2b"),
//   new All([
//     new Leaf("c2c"),
//     new Leaf("c2d"),
//     new Any([
//       new Leaf("o3a"),
//       new Leaf("o3b")])])])
          
// console.log(c2s.expand())

// A person is a British citizen if –
//   (a) the person is born –
//       (i)  in the United Kingdom after commencement, or
//       (ii) in a qualifying territory on or after the appointed day; and
//   (b) when the person is born, the person’s father or mother is–
//       (i)   a British citizen;
//       (ii)  settled in the United Kingdom; or
//       (iii) settled in the qualifying territoryin which the person is born.

// this motivates an expansion rule along the lines of
//   com(say(A), any(B, C))
//   -->
//   any(ele(A ++ B),
//       ele(A ++ C))


export const bna1981_1_1_text =
`  com(
    all(
      com(
        say('the person is'),
        any(ele('born in the United Kingdom after commencement'),
            say('or'),
            ele('born in a qualifying territory on or after the appointed day'))
      ),
      say('and'),
      com(
        say('the person’s'),
        any(
          ele('father'),
          say('or'),
          ele('mother')
        ),
        say('is'),
        any(ele('a British citizen'),
            say('or'),
            ele('settled in the United Kingdom'),
            say('or'),
            ele('settled in the qualifying territory in which the person is born'))
      )
    )
  )
`

export const bna1981_1_1 = eval(bna1981_1_1_text)

const with_a_bit_less_unnecessary_ink_on_the_screen =
`


  * a person is a British citizen if
    & the person is
      XOR born in the United Kingdom after commencement
      XOR born in a qualifying territory on or after the appointed day (colonies)
    & the person’s
      OR  father
      OR  mother
      - is
      OR  a British citizen
      OR  settled in the United Kingdom
      OR  (colonies) => settled in the qualifying territory in which the person is born

`
