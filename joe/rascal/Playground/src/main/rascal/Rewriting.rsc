module Rewriting

import IO;
import ParseTree;

int fac(0) = 1;
default int fac(n) = n * fac(n - 1);

bool find(e, [_*, e, _*]) = true;
default bool find(_, _) = false;

list[&T] dup([*a, e, *b, e, *c]) = dup([*a, e, *b, *c]);
default list[&T] dup(l) = l;

// void main(){
//   result = find(fac(3), [1,2,6,4,3]);
//   println(result);
// }