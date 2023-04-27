module Rewriting

// import IO;
// import ParseTree;

int fac(0) = 1;
default int fac(int n) = n * fac(n - 1);

bool find(e, [*_, e, *_]) = true;
default bool find(_, _) = false;

list[&T] dedup([*a, e, *b, e, *c]) = dedup([*a, e, *b, *c]);
default list[&T] dedup(list[&T] l) = l;

// void main(){
//   result = find(fac(3), [1,2,6,4,3]);
//   println(result);
// }