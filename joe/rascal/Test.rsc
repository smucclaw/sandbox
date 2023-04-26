module Test

import IO;
import ParseTree;

int fac(0) = 1;
default int fac(int n) = n * fac(n - 1);

bool find(e, [_*, e, _*]) = true;
default bool find(_, _) = false;

list[&T] dup([*&T a, &T e, *&T b, e, *&T c]) = dup([*a, e, *b, *c]);
default list[&T] dup(list[&T] l) = l;

void main(){
  result = find(fac(3), [1,2,6,4,3]);
  println(result);
}