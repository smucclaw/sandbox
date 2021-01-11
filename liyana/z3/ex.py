#!/usr/bin/python

from z3 import *

# the command 'solve', is implemented usingt the Z3 solver API
x = Int('x')
y = Int('y')
solve(x > 2, y < 10, x + 2*y == 7)

x = Int('x')
y = Int('y')
print (simplify(x + y + 2*x + 3)) # simplify reduced the equation to the simples form
print (simplify(x < y + x + 2))
print (simplify(And(x + 1 >= 3, x**2 + x**2 + y**2 + 2 >= 5)))

x = Int('x')
y = Int('y')
n = x + y >= 3
print ("num args: ", n.num_args())
print ("children: ", n.children())
print ("1st child:", n.arg(0))
print ("2nd child:", n.arg(1))
print ("operator: ", n.decl())
print ("op name:  ", n.decl().name())

#Z3 can solve nonlinear polynomial constraints but not really recommended (better for first-order logic)
x = Real('x')
y = Real('y')
solve(x**2 + y**2 > 3, x**3 + y < 5)

set_option(precision=30) # set_option is used to configure the Z3 environment
print("Solving, and displaying result with 30 decimal places:")
solve(x**2 + y**2 == 3, x**3 == 2)

print (1/3)
print (RealVal(1)/3)
print (Q(1,3))

x = Real('x')
print (x + 1/3)
print (x + Q(1,3))
print (x + "1/3")
print (x + 0.25)

x = Real('x')
solve(3*x == 1)

set_option(rational_to_decimal=True)
solve(3*x == 1)

set_option(precision=30)
solve(3*x == 1)

x = Real('x')
solve(x > 4, x < 0)

x = Int('x')
y = Int('y')

s = Solver()
print (s)

s.add(x > 10, y == x + 2)
print (s)  
print ("Solving constrains in the solver s...")
print (s.check())

print ("Create a new scope...")
s.push()
s.add(y < 11)
print(s)
print("Solving updated set of constraints...")
print(s.check())

print("Restoring state...")
s.pop()
print(s)
print("Solving restored set of constraints...")
print(s.check())

# solver returns unknown
x = Real('x')
s = Solver()
s.add(2**x == 3)
print (s.check())

# the following shows how to traverse the constraints asserted into a solver, and how to collect performance statistics for the check method.

x = Real('x')
y = Real('y')
s = Solver()
s.add(x > 1, y > 1, Or(x + y > 3, x - y < 2))
print("asserted constraints...")
for c in s.assertions():
    print (c)

print (s.check())
print ("statistics for the last check method...")
print (s.statistics())
# Traversing statistics
for k,v in s.statistics():
    print ("%s : %s" % (k, v))

x, y, z = Reals('x y z')
s = Solver()
s.add(x > 1, y > 1, x + y > 3, z - x < 10)
print(s.check())

m = s.model()
print ("x = %s" % m[y])

print ("traversing model...")
for d in m.decls():
    print ("%s = %s" % (d.name(), m[d]))

x = Real('x')
y = Int('y')
a, b, c = Reals('a b c')
s, r = Ints('s r')
print (x + y + 1 + (a + s))
print (ToReal(y) + c)

a, b, c = Ints('a b c')
d, e = Reals('d e')
solve(a > b + 2,
      a == 2*c + 10,
      c + b <= 1000,
      d >= e)

x, y = Reals('x y')
# Put expression in sum-of-monomials form
t = simplify((x + y)**3, som=True)
print (t)
# Use power operator
t = simplify(t, mul_to_power=True)
print (t)

x, y = Reals('x y')
# Using Z3 native option names
print (simplify(x == y + 2, ':arith-lhs', True))
# Using Z3Py option names
print (simplify(x == y + 2, arith_lhs=True))

print ("\nAll available options:")
help_simplify()

p, q = Bools('p q')
demorgan = And(p, q) == Not(Or(Not(p), Not(q)))
print (demorgan)

def prove(f):
    s = Solver()
    s.add(Not(f))
    if s.check() == unsat:
        print ("proved")
    else: 
        print ("failed to prove")

print ("Proving demorgan...")
prove(demorgan)

print ([x + 1 for x in range(5)])
X = [ Int('x%s' % i) for i in range(5) ]
Y = [ Int('y%s' % i) for i in range(5) ]
print (X)

X_plus_Y = [ X[i] + Y[i] for i in range(5) ]
print (X_plus_Y)

X_gt_Y = [ X[i] > Y[i] for i in range(5) ]
print (X_gt_Y)

print (And(X_gt_Y))

X = [ [ Int("x_%s_%s" % (i+1, j+1)) for j in range(3) ]
      for i in range(3) ]
pp(X)
