
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

// canonicalization to disjunctive normal form
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

    if (vine.anyAll === AnyAll.All) {
      return {
        type: 'parent',
        anyAll: AnyAll.All,
        hideShow: vine.hideShow,
        children,
        bool: vine.bool
      };
    } else if (vine.anyAll === AnyAll.Any) {
      let newChildren : Vine[] = [];

      children.forEach(child => {
        if ((child.type == 'linear' && child.children && child.children.length > 0 ) ||
          child.type === 'parent' && (child.anyAll === AnyAll.All && child.hideShow === HideShow.Expanded)) {
          newChildren = distributeOrOverAnd(newChildren, child.children || []);
        } else {
          newChildren.push(child);
        }
      });

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

function distributeOrOverAnd(orChildren:Vine[], andChildren:Vine[]) {
  if (orChildren.length === 0) return andChildren;

  let distributed : Vine[] = [];
  
  orChildren.forEach(orChild => {
    andChildren.forEach(andChild => {
      distributed.push({
        type: 'parent',
        anyAll: AnyAll.All,
        hideShow: HideShow.Expanded,
        children: [orChild, andChild]
      });
    });
  });

  return distributed;
}