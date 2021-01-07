#!/usr/bin/python

from z3 import *

# Create the solver
s = Solver()

# Declare our variables: "pie_price", which we know the value, "num_pies", which we don't, and "pies_owing", which depends upon the values of the other two
pie_price = Real('pie_price')
num_pies = Int('num_pies')
pies_owing = pie_price * num_pies

# Assert that pie_price is equal to 3.14
s.add(pie_price == 3.14)

# Assert that pies_owing is greater than 10
s.add(pies_owing > 10)

# Ask if these can be true at the same time
print(s.check()) # returns "sat" - they can be!!
print(s.model()[num_pies]) #4
