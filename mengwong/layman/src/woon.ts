import _ from "lodash"
import 'lodash.product';
import { Node, Edge, XYPosition, Position } from 'reactflow'

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

export class Vine { // your basic tree, with AnyAll leaves, and Leaf/Fill terminals.
  constructor(
    public viz  ?: HideShow,
    public   id ?: number,
  ) {
    this.id = id ?? idMax++;
  }
  expand(_fp: (v: Vine) => boolean, _fc: (v: Vine) => boolean): Vine[][] { return [[this]] }
   // takes two filter functions; first applied to the parent, the second to be applied to the children.
   // will exclude children where both functions return true.
   // the sentence rendering code uses this to hide "or" fillers since those don't belong in the sentence.
  getFlowNodes(_newPos:XYPosition) : Node[] { return [] }
  getFlowEdges() : Edge[] { return [] }
}


export class AnyAll extends Vine {
 constructor(
   public c : Vine[],
   viz ?: HideShow,
   id  ?: number) { super(viz, id); console.log(`AnyAll constructed: ${this.id}`) }
   expand(fParent: (v:Vine) => boolean,
          fChild:  (v:Vine) => boolean) : Vine[][] {
    if (this?.viz === HideShow.Collapsed) { return xprod(... this.c.map(x => x.expand(fParent, fChild))) }
    const merged = this.merge(...(this.c
                                    .filter(ch => ! (fParent(this) && fChild(ch)))
                                    .map( c => c.expand(fParent, fChild))))
    return merged
   }
  merge<T>(...l:Vine[][][]) : Vine[][] { return [] }
 }

export class All extends AnyAll {
   merge (...l:Vine[][][]) : Vine[][] { // console.log("* doing All merge");
    return xprod(...l)
   }
   getFlowNodes(relPos:XYPosition) : Node[] {
    console.log(`* All ${this.id} getFlowNodes`);
    return [ {
       id: `${this.id}`,
       type: 'group',
       data: { label: `all` },
       position: relPos,
       sourcePosition: Position.Left, targetPosition: Position.Right,
      },
      ...(this.c.flatMap((x,i) => x.getFlowNodes({ x: relPos.x + 100*i+1, y: relPos.y })))
     ]
   }
   getFlowEdges() : Edge[] {
    // we connect ourselves to our first child, and the children to each other in sequence.
    // this will probably change when we figure out subflows.
    const edges = [
      { id: `e${this.id}-${this.c[0].id}`, source: `${this.id}`, target: `${this.c[0].id}` },
        ...(this.c.slice(-1).flatMap((n,i) => [{ id: `e${n.id}-${this.c[i+1].id}`, source: `${n.id}`, target:`${this.c[i+1].id}`},
                                               ...n.getFlowEdges()]))
    ]
    return edges
   }
  }
// const initialEdges = [{ id: 'e1-2', source: '1', target: '2' }];

export class Any extends AnyAll {
  merge (...l:Vine[][][]) : Vine[][] {    // console.log("* doing Any merge");
    // we use this mechanism to exclude any top-level elements which are only Fill nodes from the sentence rendering,
    // but we don't want to exclude them from the flowchart rendering.
    return xprod(l.flat(1))
  }
  getFlowNodes(relPos:XYPosition) : Node[] {
    return [ {
      id: `${this.id}`,
      type: 'group',
      data: { label: `any` },
      position: relPos,
      sourcePosition: Position.Left, targetPosition: Position.Right,
    },
      ...(this.c.flatMap((x,i) => x.getFlowNodes({ x: relPos.x, y: relPos.y + 50*(i+0) })))
    ]
  }
  getFlowEdges() : Edge[] {
    // we connect ourselves to all the children in parallel
    const edges = this.c.flatMap((n,i) => [{ id: `e${this.id}-${n.id}`, source: `${this.id}`, target: `${n.id}` },
                                           ...n.getFlowEdges()])

    return edges
  }
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
     }
    ]
  }
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
    }
    ]
  }
}

const isAll    = (v: Vine) => v instanceof All
const isAny    = (v: Vine) => v instanceof Any
const isLeaf   = (v: Vine) => v instanceof Leaf
const isFill   = (v: Vine) => v instanceof Fill

enum A {
  ny, // disjunctive list
  ll, // conjunctive list
}

export enum HideShow {
  Expanded = "expanded", Collapsed = "collapsed"
}

export const mustSing = com(
  say("... who"),
  ele("walks"),
  say("and"),
  any(
    ele("drinks"),
    say("or"),
    ele("eats")
  )
);

export function all (...l:Vine[]) : All { return new All(l) } // conjunction
export function any (...l:Vine[]) : All { return new Any(l) } // disjunction
export function com (...l:Vine[]) : All { return new All(l) } // compound
export function ele (l:string) : Leaf { return new Leaf(l) }  // element
export function say (l:string) : Fill { return new Fill(l) }  // filler

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
        any(ele('claw'), ele('tooth'))
      )
    ),
  ),
)

if (require.main === module) {
  const expanded = narnia.expand(_.constant(false), _.constant(false));
  console.log("* narnia")
  console.log(expanded);
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