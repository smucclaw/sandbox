import _ from "lodash"
import 'lodash.product';
export type Vine = Parent | Leaf | Linear;

export interface Parent {
  type: 'parent';
  anyAll: AnyAll;
  hideShow: HideShow;
  children: Vine[];
  bool?: boolean;
}

export interface Leaf {
  type: 'leaf';
  text: string;
  bool?: boolean;
}

export interface Linear {
  type: 'linear';
  text?: string;
  children?: Vine[];
  bool?: boolean;
}

export enum AnyAll { Any, // disjunctive list
                     All  // conjunctive list
                   }

export enum HideShow {
  Expanded = "expanded", Collapsed = "collapsed"
}

export interface Document {
  id: string;
  title: string;
  content: Vine;
}

// canonicalization to disjunctive normal form.
// postcondition: either the returned Vine is a leaf, or it is a parent node with AnyAll set to Any, or it is a linear with no children
// linears are just filler terms; leaves can take values; parent nodes contain children.
export function canonicalizeToDNF(vine:Vine): Vine {
  if (vine.type === 'leaf') {
    return vine;
  }

  if (vine.type === 'linear') { // we treat as an All
    if (!vine.children || vine.children.length === 0) {
      return vine;
    }
    return canonicalizeToDNF({
      type: 'parent',
      anyAll: AnyAll.All,
      hideShow: HideShow.Collapsed,
      children: vine.children,
      bool: vine.bool
    });
  }

  if (vine.type === 'parent') {
    let children = vine.children.map(canonicalizeToDNF);
    // each child is now in DNF

    if (vine.anyAll === AnyAll.All) {
      console.log(`(All) ${children.length} children before distribution:`, children)
      const newChildren = _.product(children.map(c => convertVineToList(c)))
      console.log(`(All) ${newChildren.length} newChildren after distributing and over or`, newChildren)

      // now newChildren is a list of [ linear, or, leaf, linear, or ]
      // rewrite it to a single or-list containing or [ ...or.children, leaf, linear, ...or.children ]
      const reducedChildren = _.reduce(newChildren, (acc, c) => { 
          acc.children.push(c)
        } 

      })

      vine.children = reducedChildren
      return vine

    } else if (vine.anyAll === AnyAll.Any) {
      let newChildren : Vine[] = [];

      children.forEach(child => {
        if ((child.type == 'linear' && child.children && child.children.length > 0 ) ||
          child.type === 'parent' && (child.anyAll === AnyAll.All && child.hideShow === HideShow.Expanded)) {
            console.log(`(child All) distributing OrOverAnd child.children = `, child.children)
            newChildren = _.product(newChildren, child.children || []);
            console.log(`(child All) distributing OrOverAnd newChildren = `, newChildren)
        } else {
          newChildren.push(child);
        }
      });
      console.log(`(Any) newChildren`, newChildren)
      return {
        type: 'parent',
        anyAll: AnyAll.Any,
        hideShow: vine.hideShow,
        children: newChildren,
        bool: vine.bool
      };
    }
  }

  throw new Error('Unknown Vine type');
}

function convertVineToList(vine: Vine): Vine[] {
  if (vine.type === 'leaf') {
    return [vine];
  }

    if (vine.children && vine.children.length > 0) {
    return vine.children;
  }

  if (vine.type === 'linear') {
    return [vine];
  }

  throw new Error('Unknown Vine type');
}

