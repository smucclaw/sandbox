import _ from "lodash"
import 'lodash.product';
import { Node, Edge, XYPosition, Position, Handle } from 'reactflow'
import { useCallback } from 'react';

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

export class Vine { // your basic tree, with AnyAll leaves, and Leaf/Fill terminals.
  toggleParent () {}
  constructor(
    public viz  ?: HideShow,
    public   id ?: number,
  ) {
    this.id = id ?? idMax++;
  }
  expand(_:ExpansionOpts): Vine[][] { return [[this]] } // runtime environment reader monad used by Original
   // takes two filter functions; first applied to the parent, the second to be applied to the children.
   // will exclude children where both functions return true.
   // the sentence rendering code uses this to hide "or" fillers since those don't belong in the sentence.
  getFlowNodes(_newPos:XYPosition) : Node[] { return [] }
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
    id  ?: number) {
    super(viz, id);
    for (const child of c) { child.recordParent(this) }
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
  assignParentGroup(nodes:Node[]) {
    console.log(`** ${this.id} assignParentGroup`);
    nodes.forEach(node => {
      if (this.c.some(child => `${child.id}` === node.id || `${child.id}-group` === node.id)) {
        node.parentId = `${this.id}-group`;
        node.extent = 'parent'
        console.log(`** ${this.id} assignParentGroup assigned ${node.id} to parent ${this.id}-group`);
      }
    });
  }
 }

export class All extends AnyAll {
   merge (...l:Vine[][][]) : Vine[][] { // console.log("* doing All merge");
    // console.log(`** All ${this.id} merge, collapsed`);
    return xprod(...l)
   }
   getFlowNodes(relPos:XYPosition) : Node[] {
    // console.log(`** All ${this.id} getFlowNodes`);
    const childFlowNodes = this.c.flatMap((x,i) => x.getFlowNodes({ x: 170*(i+0)+40, y: 0 }))
    const nodes = [
      { // the hypernode group
       id: `${this.id}-group`,
       type: 'group',
       data: { label: `all` },
       position: relPos,
       sourcePosition: Position.Right, targetPosition: Position.Left,
       style: {
        width: Math.max(...childFlowNodes.map(node => node.position.x)) - relPos.x + 100,
        height: Math.max(...childFlowNodes.map(node => node.position.y)) - relPos.y + 100,
       }
      },
      { // a pseudo-node which is basically a tiny little circle which acts as a common source for the children in the group
        id: `${this.id}`,
        type: 'default',
        data: { label: `all` },
        position: relPos,
        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: {
          width: 20,
          height: 20,
          borderRadius: "50%",
          backgroundColor: "green"
        },
      },
      ...childFlowNodes
     ]
     this.assignParentGroup(nodes);

    console.log(`** All ${this.id} getFlowNodes`, nodes);
    return nodes
   }
   getFlowEdges() : Edge[] {
    // we connect ourselves to our first child, and the children to each other in sequence.
    // this will probably change when we figure out subflows.
    const edges = _.flatten([
      { id: `e${this.id}-${this.c[0].id}-firstchildOfAll`, source: `${this.id}`, target: `${this.c[0].id}` },
      ...(this.c.slice(0, -1).flatMap((n,i) => [{ id: `e${n.id}-${this.c[i+1].id}`, source: `${n.id}`, target:`${this.c[i+1].id}`},
                           ...n.getFlowEdges()])),
       this.c[this.c.length - 1].getFlowEdges()
    ])
    console.log(`** All ${this.id} getFlowEdges`, edges);
    console.log(`All originally`, this)
    return edges
   }
   clone() { return new All(this.c.map(x => x.clone()), this.viz, this.id) }
  }
// const initialEdges = [{ id: 'e1-2', source: '1', target: '2' }];

// the parent/group/hypernode for an Any object, a custom node with multiple handles.
// the "outer" handles are intended for use by peers and parents.
// the "inner" handles connect the children.
export function AnyGroup (v:Vine[], relPos:XYPosition) : Node[] {
  // iterate thorugh v.c, calling getFlowNodes on each child, and then computing the position of the next child based on the extent of the bounding box so far.
  // This deals with the situation where a child 
  const childFlowNodes = v.flatMap((x,i) => x.getFlowNodes({ x: 40, y: 50*(i+0) }))

  const nodes = [
    { // this becomes the hypernode
    id: `${v[0].id}-group`,
    type: 'default',
    data: { label: `` },
    position: relPos,
    sourcePosition: Position.Left, targetPosition: Position.Left,
    style: {
      width: Math.max(...childFlowNodes.map(node => (node.position.x + (node.style?.width as number) || 0))) + 40,
      height: Math.max(...childFlowNodes.map(node => node.position.y)) - relPos.y + 50,
     }
    },
        ...childFlowNodes,
      ]
  // this.assignParentGroup(nodes);
  console.log(`** AnyGroup getFlowNodes`, nodes);
  return nodes
}

export class Any extends AnyAll {
  merge (...l:Vine[][][]) : Vine[][] {    // console.log("* doing Any merge");
    // we use this mechanism to exclude any top-level elements which are only Fill nodes from the sentence rendering,
    // but we don't want to exclude them from the flowchart rendering.
    // console.log(`* Any ${this.id} merge, should be expanding`);
    return xprod(l.flat(1))
  }
  getFlowNodes(relPos:XYPosition) : Node[] {
    const childFlowNodes = this.c.flatMap((x,i) => x.getFlowNodes({ x: 40, y: 50*(i+0) }))
    const midpoint_y = Math.max(...childFlowNodes.map(node => node.position.y)) / 2;
    const rightmargin_x = Math.max(...childFlowNodes.map(node => node.position.x)) + 170;
    const nodes = [
      { // this becomes the hypernode
      id: `${this.id}-group`,
      type: 'default',
      data: { label: `` },
      position: relPos,
      sourcePosition: Position.Left, targetPosition: Position.Left,
      style: {
        width: Math.max(...childFlowNodes.map(node => (node.position.x + (node.style?.width as number) || 0))) + 40,
        height: Math.max(...childFlowNodes.map(node => node.position.y)) - relPos.y + 50,
       }
      },
          ...childFlowNodes,
        ]
    this.assignParentGroup(nodes);
  console.log(`** Any ${this.id} getFlowNodes`, nodes);
    return nodes
  }
  getFlowEdges() : Edge[] {
    // we connect ourselves to all the children in parallel
    const edges = this.c.flatMap((n,i) => [
      { id: `e${this.id}-${n.id}-in`,  source: `${this.id}-group`, target: `${n.id}` },
      { id: `e${this.id}-${n.id}-out`, source: `${n.id}`, target: `${this.id}-out` },
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
  getFlowNodes(relPos:XYPosition) : Node[] {
    return [ {
      id: `${this.id}`,
      type: 'default',
      data: { label: this.text },
      position: relPos,
      sourcePosition: Position.Right, targetPosition: Position.Left,
      style: {
        width: 100,
        height: 50,
        backgroundColor: this.value == undefined ? "white" : this.value ? "green" : "red"
      }
     }
    ]
  }
  clone() { return new Leaf(this.text, this.value, this.dflt, this.viz, this.id) }
}

// non-ground-terms, just inert bits of text needed for grammatical comprehensibility. This replaces the Pre / PrePost from AnyAll
export class Fill extends Vine {
  constructor(
    public fill     : string,
    viz  ?: HideShow,
    id      ?: number
  ) { super(viz,id) }
  getFlowNodes(relPos:XYPosition) : Node[] {
    return [ {
      id: `${this.id}`,
      type: 'default',
      data: { label: this.fill },
      position: relPos,
      sourcePosition: Position.Right, targetPosition: Position.Left,
      style: {
        width: 100,
        height: 50,
      }
    }
    ]
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
  getFlowNodes(relPos:XYPosition) : Node[] {
    const childFlowNodes = this.c.getFlowNodes({ x: relPos.x + 170, y: relPos.y })

    const nodes = [
      { // the hypernode group
       id: `${this.id}-group`,
       type: 'group',
       data: { label: `not` },
       position: relPos,
       sourcePosition: Position.Right, targetPosition: Position.Left,
      },
      { // a pseudo-node which is basically a tiny little circle which acts as a common source for the children in the group
        id: `${this.id}`,
        type: 'default',
        data: { label: `not` },
        position: relPos,
        sourcePosition: Position.Right, targetPosition: Position.Left,
        style: {
          width: 20,
          height: 20,
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
      say("maybe"),
      ele("drinks"),
      say("or"),
      com( // all
        ele("eats"),
        say("if they are hungry?"),
        say("maybe just greedy?")
      )
    )
  );

export function all (...l:Vine[]) : All { return new All(l) } // conjunction
export function any (...l:Vine[]) : All { return new Any(l) } // disjunction
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

export const cheating = com(
  com(say('by'), ele('deceiving'), say('any person')),
  com(say('whether'),say('such deception'),any(
    com(say('was the'),
	any(ele('sole'),
	    ele('main')),
	say('inducement')),
    ele('not'))),
  any(com(any(ele('fraudulently'),
	      ele('dishonestly')),
	  say('induces the person so deceived to'),
	  any(ele('deliver any property to any person'),
	      ele('consent that any person shall retain any property')),
	 ),
      com(ele('intentionally induces'),
	  say('the person so deceived to'),
	  all(any(ele('do anything which he would not do'),
		  ele('not do anything which he would do')),
	      say('if he were not so deceived'),
	      say('and'),
	      say('which act or omission'),
	      any(ele('causes'),
		  say('or'),
		  ele('is likely to cause')),
	      any(ele('damage'),
		  say('or'),
		  ele('harm')),
	      say('to any person in'),
	      any(ele('body'),
		  ele('mind'),
		  ele('reputation'),
		  say('or'),
		  ele('property'))
	     )
	 )
     )
)

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
