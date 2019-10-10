# -*- coding: utf-8 -*-
"""
Created on Wed Oct  9 20:06:41 2019

@author: Boxi
"""

## 2.3 Importing Module

import math
print(dir(math)) # Returns a list of the names inside the math namespace

print(math.pi)
print(math.cos(math.pi))

# Use the built-in function dir() to show all the object and variable names in
# your current environment/ namespace. This is not used often.
# Use as to refer the imported module by another name
import math as m
print(m.pi)

# Use from ... import to import only the specific object(s) from a module
from math import sin, pi
print(sin(pi / 2))

# Use the wild * to import everything from a module. This is NOT recommended 
# because it might conflict with the names of the existing objects in your
# current environment.
from math import *
print(log(1))

# We can also use as to refer an imported object by another name.
from math import pi as pie
print(pie)

# For data analytics, you would probably put the following lines of code in 
# the first cell of your Juptyer notebook and run it first. Here the 
# abbreviations plt, np, and pd are almost standard practice.
%matplotlib inline
%config InlineBackend.figure_format = 'retina' # For if you have retina display
import matplotlip.pyplot as plt
import numpy as np
import pandas as pd

# If Python gives an ImportError: No module named ... during import, then
# either the package is not installed properly, or its locaiton path is not
# known to Python so Python cannot find it.


## 2.4 Numbers and Arithmetic

# integer and floating point numbers with implicit type conversion
# Arithmetic: +, -, *, /, //, %, **, (, ) (Note that unlike R, ^ is the 
# bitwise XOR operator but not the exponent.)
1
1.0
1 + 0.2 * (3e2 - 4) / 5e-1
-1 ** 2 # Note this equals to -1

# Division by 0 does not produce NaN but gives the ZeroDivisionError: 
# division by zero error instead.
# The built-in type() and isinstance() functions reveal the type of the 
# object.

print(type(1))

print(isinstance(1.0, float))

# Explicit type conversion with int() and float() are not used often.
int(3.7)
float(2.0)

# Built-in mathematical functions: abs(), max(), min(), round(), sum()
# The math module:
    # Functions: ceil(), floor(), isfinite(), isinf(), isnan(), exp(), log()
    # log10(), sqrt(), trigonometric functions
    # Constants: pi, e, inf, and nan
# Note that NumPy package has its own set of mathematical functions that 
# are designed for multi-dimensional arrays.
    

## 2.5 String

# A stirng is a sequence of characters by a pair of single quotes '' or
# double quotes "".
'hello'
'world'

# built-in function: len()
# String arithmetic: + and *

print('XO' * 2)

print('Om' + ' nom' * 3 + '.' * 3)

# Use int() and float() to convert a string to a number.
int("12")
float("34.5")


## 2.6 Special Value

# Basically, the only special value in Python is None. It is not a number.
# It represents nothing-ness. It has no length. But it has technical
# usage in the Python language. (This is like NULL in R.)

# There is no special value to represent misisng data (unlink NA in R).
# Since Numpy does not have a native NA type, Pandas uses np.nan to
# indicate missing value.


## 2.7 Variable

# Variable name is case sensistive and cannot contain a dot . (which is the
# syntax used to a name inside a namespace e.g. math.pi).
# The naming convention is lowercase words separated by the underscores
# e.g. house_price.
# Here is the list Python reserved keywords that cannot be used as 
# variable name. Note that lambda is a reserved keyword.

import keyword
print(keyword.kwlist)

'''
['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break',
 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 
 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal',
 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
'''

# Assignment operator: = (There is no such thing as <- like R.)

quantity = 7
price = 1.95
total_cost = quantity * price

# Weakly typed: The data type of the variable is not pre-defined but is
# inferred from the data at runtime. (This is similar to R.)
# Variable name is reusuable even if the new value is of another type.
# Chained assignment is allowed.

a = b = c = 3 # c is not a reserved keyword in Python

# Augmented / compound assignment: +=, -=, *=, /=, %= (This is like C++
# and Java.)

x = 0
x += 1 # x = x + 1
x -= 2
x *= 3
x /= 4
print(x)


## 2.8 Boolean Logic

# Boolean values : True, False (They are case sensitive)
# Value comparison: ==, !=, >, <, >=, <=

print(1 == 1.0)
# True

print(True == 1) # Implicit type promotion from bool to number
# True

print(1 == "1") # No implicit type promotion from number to string
# False

print(None == None)
# True

# Identity comparison: is and is not check if two variable names refer to
# the same object

men = 2
women = 2.0
print(men == women) # Are their values equal?
# True

print(men is women) # Do they refer to the same object?
# False

print(type(2.718) is float)
# True

# Boolean operators: and, or, not have short-circuit behavior (similar to R).

x = 7
print(x >= 10 or x < -5)
# False

trick = False
treat = True
scary = False
print(trick or treat and not scary)
# True

# Base Python does not have element-wise AND or OR operators. Calculation
# in base Python is not vectorized anyway. This is where NumPy comes to help
# The | and & operators are for bitwise AND and bitwise OR (similar to C++
# and Java but unlike R).
# Chained comparison is possible.

x = 5
print(1 < x <= 10)
# True

print(True == 1 == 1.0)
# True

print(1 < 2 > 3) # 1 < 2 and 2 > 3
# False

# Operator precedence is similar to most modern programming languages (like R)


## 2.9 List

# A list in Python is a sequance of items of possibly different types. On
# the other hand, the role of R's vector() is fulfilled by NumPy array in
# Python.
# How to create a list?

x = list()
x = []
x = [1] # A list of one int but not a single int
x = [True, 2, 'three']
x = list(ranges(5)) # Start at 0 and stop before 5
                    # In general, can use range (start, stop, step)
                    
# list concatenation: + and *

x = [1, 2]
y = [3, 4, 5]
print(x + y)
# [1, 2, 3, 4, 5]

x += y # Compound assignment
print(x)
# [1, 2, 3, 4, 5]

print(x * 3)
# [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

# Integer indexing only, (Python's list does not support boolean indexing
# and does not have name tags like R's list.)

x = [6, -2, 1, -4, 3, 7, 5, 9]
x[0] # First element is at index 0
[1, 2, 3][1] # Note the two different meanings of [] here

# Slicing
x[2:5] # Slice from index 2 to jsut before index 5
x[3:3] # Empty list
x[2:7:2] # In general, use x[start:stop:step]
x[6:2:-1] # negative step is decreasing index

# omitting start or stop means all
x[5:] # All elements starting at index 5
x[:5] # All elements before (so not including) index 5
x[::2] # All elements with step 2
x[::-1] # Reverse the sequence

# Out-of-bound indexing
x[100] # IndexError: list index out of range
x[:100] # No error if slicing. It means the end of the list.
x[100:] # No error. It returns an empty list.
# This seemingly strange behavior is actually very useful when programming.

# Negative indexing: -k means n-k where n is the length of x
x[-1] # Last element
x[-2:] # Last two elements
x[:-2] #All elements except the last two

# Nested lists and indexing
x = [1, [2, [3, [4]]]]
print(x[1][1][1][0])
# 4

# Modifying, inserting, and removing elements from a list
x = [6, -2, 1, -4, 3, 7, 5, 9]

# Modifying
x[0] = 60
x[1:3] = [-20, 10]
x[4:6] = 40 # Error. No recycling of value like R.

# Inserting
x.append(12) # Add to the end in-place.
x.insert(4, -6) # Insert an item at index 4 in-place.
x[5:5] = [-3] # Insert a sequence of item(s) at index 5.
x[:0] = [7] # Insert to the front before the existing first element

# Removing
x.remove(7) # Just the first occurence
x[i:j] = [] # Remove all elements from index i up to before index j
del x[i:j] # Same as x[i:j] = []
x[:] = [] # Remove all elements
del x[:] # Same as x[:] = []
del x # Delete the variabe name itself

# Inserting by slicing [i:i] and by insert() are different.
x = [1, 2, 3]
y = [40, 50]

x.insert(1, y) # Insert as an item
print(x)
# [1, [40, 50], 2, 3]

x[3:3] = y # Insert as a sequence
print(x)
# [1, [40, 50], 2, 40, 50, 3]

# Checking memebership: in and not in
x = [6, -2, 1, -4, 3, 7, 5, 9]
print(6.0 in x) # Comparison is done by both == and "is".
# True

print(9 not in x)
# False

# Built-in functions: count(), extend() in-place, len(), min(), max(),
# reverse() in-place, sort() in-place, sorted()
# There are often more than one built-in function in Python to accomplish
# a task but with slightly different behaviour. For example, sorted() is a
# standalone function for sorting any sequence, and sort() is a function 
# "inside" a  list to sort it in-place.
# https://docs.python.org/3/howto/sorting.html

x = [3, 1, 5, 4, 2]
print(sorted(x)) # Returns a sorted copy but does not modify x.
# [1, 2, 3, 4, 5]

print(x)
# [3, 1, 5, 4, 2]

x.sort() # Use a dot . to refer to a function "inside" a list.
print(x)
# [1, 2, 3, 4, 5]


## 2.10 0-Based vs 1-Based Indexing

# What are the advantages of 0-based indexing in Python in contrast to 
# 1-based indexing in R? Or why is Python a more beautiful language than R?

# Advantage 1: Length of the slice
p[i:j] # In Python, has length j - i
r[i:j] # In R, has length j - i + 1

# Advantage 2: A slice of some elements
# Obtaining the k elements starting at index i
p[i:i+k] 
r[i:(i+k-1)]

# What is the advantage of the "half-open interval from the right" [i,j] 
# slicing in Python in contrast to the "closed interval" [i,j] slicing in
# R?

# Advantage 3: A common index without any +1 or -1 adjustment
# Split the  sequence into two chunks at index i
p[:i] + p[i:] # Note that this works for all i even if it is out-of-bound
r[1:i] + r[(i+1):length(r)]


# 2.11 View, Shallow Copy, and Deep Copy

# The variable assignment operator = in Python is always just name binding
# i.e. it creates a view / alias / reference to the same object but not a 
# separate copy of the object. (This is a major difference from R in which
# it is always a depe copy.)

x = [1, 2, 3]
y = x # The variable name y refers to the same data that x refers to.
y[0] = 10
print(x)
# [10, 2, 3]

print(y is x)
# True

# To create a shallow copy of a list, use the slicing notiation [:] or 
# copy().
x = [1, 2, 3]
y = x[:] # Or y = x.copy()
y[0] = 10
print(x)
# [1, 2, 3]

print(y is x)
# False

# A shallow copy only removes the 1st layer of dependency but not those
# from any deeper layer(s).
# Draw a picture of the computer memory.
x = [[1, 2], [3, 4, 5]]
y = x.copy() # Shallow copy
y[1][2] = 50
print(x)
# [[1, 2], [3, 4, 50]]

print(y is x)
# False

print(y[1] is x[1])
# True

# To create a truly deep copy i.e. an entirely separate object, use the
# copy module and its deepcopy() function.

import copy

x = [[1, 2], [3, 4, 5]]
y = copy.deepcopy(x) # Deep copy
y[1][2] = 50
print(x)
# [[1, 2], [3, 4, 5]]

print(y[1] is x[1])
# False


