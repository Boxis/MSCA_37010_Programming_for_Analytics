# -*- coding: utf-8 -*-
"""
Created on Mon Oct 21 19:23:32 2019

@author: Boxi
"""

## 3 Lecture 8


# 3.1 Tuple

# A tuple is a sequence of items of possibly different types.
# Main difference between a tuple and a list is that a tuple is immutable
# i.e. it's content cannot be modified once it has been created.
# Why do we need immutable tuple() if we already have a more flexible list()?
    # 1. Protect against accidental modification of data
    # 2. The dictionary dict() data structure can only use immutable object
    # as key
    # 3. Technicality in Python: Tuple appears everywhere e.g. function
    # argument, packing and unpacking
# How to create a tuple?
    
x = tuple() # Empty tuple
x = ()
x = (1,) # Singleton tuple. Note the comma is necessary. Otherwise it is just
         # a number
x = (True, 2, 'three')

y = [1, 2, 3]
x = tuple(y)

x = 1, # The pair of paraentheses is unnecessary witha  comma
x = True, 2, 'three'

# Integer indexing is the same as in list.
# Cannot insert into or modify the content of a tuple.

x = (1, 2, 3)
x[0] = 10 # TypeError: 'tuple' object does not support item assignment


# 3.2 Packing and Unpacking

# Packing: Combine several comma-separated items together as a tuple.

x = 1, 2, 3

# Unpacking: Separate the content of a sequence (such as list or tuple) into
# several chunks.

x = [1, 2, 3]
small, medium, large = x
print(large)
# 3

geo_coord = [41.882807, -87.623268]

latitude = geo_coord[0] # Not Pythonic
longitude = geo_coord[1]
latitude, longitude = geo_coord # Pythonic

# Here is the Pythonic way to swap two variables.

a = 1
b = 2
a, b = b, a # Packing followed by unpacking
print(a, b)
# 2 1

# Use _ as a placeholder for the unpacked content that we do not want
# to assign a variable name to.

x = [1, 2, 3]
_, medium, _ = x

# Use the special notation * to collect the rest of the items as a list
# after unpacking.

a, *b, c = 1, 2, 3, 4
print(b)
# [2, 3]

# Can use * and _ together.

a, b, *_ = 1, 2, 3, 4, 5, 6, 7, 8
print(a, b)
# 1 2


# 3.3 Dictionary

# A dictionary in Python is a data structure for a collection of items that
# are indexed by possibly non-numeric keys. In other words, it is a 
# collection of key-value pairs. The items/values can be of different types.
# It is also known as associative array, map, lookup table, or hash table
# in other programming languages.
# Unlike a list and a tuple, a dictionary is not a sequence and does not
# have any ordering. Therefore, we cannot use integer indexing.
# Draw a picture of a "bucket" to represent a dictionary.
# Why do we need a dictionary?
    # 1. Sometimes it is more natural to organize our data by a non-
    # numerical index e.g. a person's name.
    # 2. It is Pythonic to use dictionary to act as a one-line switch
    # instead of using an IF element.
# How to create a dictionary?
    
x = dict() # Empty dictionary
x = {}

sesame = dict(Elmo='red') # Convert to string as key
sesame = dict([('Elmo', 'red'), ('Cookie Monster', 'blue')])
sesame = {'Elmo':'red', 'Cookie Monster':'blue'}

# Technically, the key must be immutable and hashable. But the keys in a
# dictionary can be of different types.

elmo = 'Elmo'
kermit = ('Kermit', 'the Frog') # A tuple is immutable
sesame = {elmo:'red', kermit:'green'}

# Insertion: Add one or more elements to a dictionary.

sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
sesame['Big Bird'] = 'yellow'
print(sesame)
# {'Elmo': 'red', 'Cookie Monster': 'blue', 'Big Bird': 'yellow'}

sesame['Big Bird'] = ['yellow', 'orange'] # Modify the value of a key
print(sesame)
# {'Elmo': 'red', 'Cookie Monster': 'blue', 'Big Bird': ['yellow', 'orange']}

x = {'Oscar':'green', 'Kermit':'green'}
sesame.update(x)
print(sesame)
# {'Elmo': 'red', 'Cookie Monster': 'blue', 'Big Bird': ['yellow', 'orange'], 'Oscar': 'green', 'Kermit': 'green'}

# Retrieval by key only. There is no concept of iteger indexing.

sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
sesame['Elmo']
sesame['cookie mosnter'] # KeyError

# use get() to avoid KeyError by provindg a default value in case the key
# is not found.

sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
print(sesame.get('Kermit', -1))
# -1

# Use keys(), values(), and items() for bulk retrieval of the keys and/or
# values. This is very useful when we want to loop through all the items
# of a dictionary.
# The ordering of the resulting sequence is arbitrary and not fixed. Your
# program should not assume or depend on a particular ordering.

sesame = {'Elmo':'red', 'Cookie Monster':'blue', 'Kermit':'green'}
print(list(sesame.keys())) # same as list(sesame)
# ['Elmo', 'Cookie Monster', 'Kermit']

print(list(sesame.values()))
# ['red', 'blue', 'green']

print(list(sesame.items()))
# [('Elmo', 'red'), ('Cookie Monster', 'blue'), ('Kermit', 'green')]

# Checking membership of a key: in and not in
sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
print('Cookie Monster' in sesame)
# True

print('Kermit' not in sesame)
# True

# Deletion: Remove a key-value pair from a dictionary.
sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
del sesame['Elmo']
print(sesame)
# {'Cookie Monster': 'blue'}

# Built-in functions for dictionary: len()
# Nested lists and dictionaries together
sesame = {'Elmo':['orange', 'red'], 'Cookie Monster':'blue'}
sesame['Big Bird'] = {'body': 'yellow', 'feet': 'orange'}
print(sesame['Elmo'][1])
# red

print(sesame['Big Bird']['body'])
# yellow


# 3.4 Hash Table

# What exactly is the difference between a list and a dictionary?
    # A list is an array of pointers.
    # A dictionary is a hash table
# Ingredients of a hash table:
    # 1. A fixed n number of buckets
    # 2. A hash function to map each key to a numerial index in {1, ..., n}
    # 3. Store the value in the bucket represented by the index
    # 4. Collision resolution to handle the case when multiple values
    # want to occupy the same bucket
# Draw a picture of a hash table with some buckets and a hash function
# Performance of single retrieval: O(n) if using name tag in R's list, and
# O(1) if using key in Python's dictionary


# 3.5 Time Complexity and Big O Notiation

# Time complexity is the analysis of the runtime of an algorithm and how
# it scales with the size of the input data.
# The big O notation is a standard way to represent the time complexity
# For example, the amount of time to retrieve an element from a sequence
# using integer indexing does not depend on length n of the sequence
# Therefore, it has constant time complexity O(1).

x = [1, ..., n]
x[n] # O(1)

# For example, computing the sum of a sequence x length n requires O(n)
# number of operations i.e. it scales linearly with input size.

x = [1, ...,  n]
total = 0
for v in x:
    total += v

# For example, computing the sum of entries of an n x n matrix m requires
# O(n^2) number of operations

total = 0
for i in range(n):
    for j in range(n):
        total += m[i,j]

# For example, the matrix multiplication of two n x n matrices requires
# O(n^3) number of opeartions (because the product n^2 entries and each
# requires a dot-product which is O(n) number of operations).
# A lot of matrix decomposition algorithms (e.g. LU, QC, Cholesky, and SVD
# are O(n^3).
# It is a fact that any (composition-based) sorting algorithm requires
# at least O(nlog_2n) number of comparisons (on average) to sort a
# a sequence. However, the simple bubble sort requires O(n^2) comparisons and
# is therefore not optimal.
# In general, an algorithm with time complexity O(nlogn) is reasonable,
# O(n^2) is not fast, and O(n^3) is slow and difficult to scale.


# 3.6 Set

# A set in Python mimics a mathematical set i.e.
    # 1. It is a collection of distinct terms of possibly different types.
    # 2. It is unordered i.e. it has no ordering and hence no index
    # indexing.
# Why do we need a set? To keep track of the distinct values automatically
# How to create a set?

x = set() # Empty set
          # Cannot use {} which is reserved for creating a dictionary
x = {1}
x = {True, 2, 'three'}
x = set([1, 2, 3, 3]) # Construct from another sequence e.g. a list and 
# remove duplications
print(x)

# Exercise: Construct a list of distinct elements of the list x.
x = [1, 4, 2, 3, 2, 5, 3, 1]
x = list(set(x))
print(x)
#[1, 2, 3, 4, 5]

# Adding and removing elements from a set.
x = {1, 2, 3}
# Adding
x.add(4) # Add one element
print(x)
# {1, 2, 3, 4}

x.add(2) # Duplicate element does not change the set.
print(x)
# {1, 2, 3, 4}

y = [6, 5, 6]
x.update(y) # Add multiple elements from a sequence
print(x)
# {1, 2, 3, 4, 5, 6}

# Removing
x.remove(2)
print(x)
# {1, 3, 4, 5, 6}

x.discard(10) # No error if the element is not in the set

# Checking memebership: in and not in, issubset() and <=, issuperset()
# and >=
x = {1, 2, 3}
y = {1, 2}

print (y in x)
# False

print(x.issuperset(y))
# True

print(x >= y)
# True

# Set operation: Union, intersection, difference, symmetric difference, etc.
x = set([1, 1, 2, 2, 3])
y = set([3, 4])
print(x.union(y))
# {1, 2, 3, 4}

print(x | y)
# {1, 2, 3, 4}

print(x.intersection(y))
# {3}

print(x - y)
# {1, 2}

print(x.symmetric_difference(y))
# {1, 2, 4}

print(x ^ y)
# {1, 2, 4}

# Built-in functions for set: len(), isdisjoint()


# 3.7 String Manipulation

# A string is a sequence of characters so it behaves literally like a
# sequence in Python. Many of the concepts of list such as integer
# indexing and manipulations also apply to a string.

s = 'Albuquerque'
print(len(s))
# 11

# Integer indexing
print(s[0])
# A

print(s[3:7])
# uque

# Compound assignment
s += ' is in New Mexico.'
print(s)
# Albuquerque is in New Mexico.

print('que' in s)
# True

# But a string is immutable so we cannot simply append() to it in-place or
# modifiy an individual character s[i] = c.
# Converting a string to a list or a set.

s = 'Mississippi'
print(list(s)) # List of the characters
# ['M', 'i', 's', 's', 'i', 's', 's', 'i', 'p', 'p', 'i']

print({s})
# {'Mississippi'}

# Multi-line string: '''...''' or """..."""
s = '''KEEP
CALM
AND
CARRY
ON
'''
print(s)
# KEEP
# CALM
# AND
# CARRY
# ON

# Useful built-in string functions: find(), join(), replace(), split(), strip()

s = 'Albuquerque'
print(s.find('qu'))
# 4

print('Albuquerque'.find('qu', 6)) # use the function directly on a string
# 8

print('mpg ~ ' + ' + '.join(['weight', 'fuel_type', 'suv']))
# mpg ~ weight + fuel_type + suv

s = 'pen pineapple apple pen'
print(s.replace('apple', 'hippo')) # Not in-place so it does not modify s
# pen pinehippo hippo pen

print(s.split()) # Default split by whitespaces
# ['pen', 'pineapple', 'apple', 'pen']

# Formatting: Construct a string using the format() function.

x = 1
y = 2
print('The sum of {} and {} is {}.'.format(x, y, x + y))
# The sum of 1 and 2 is 3.

print('{0}{1}{0}'.format('abra', 'cad')) # By position
# abracadabra

print('{p1} {p2}{a} {a} {p1}'.format(p1='pen', p2='pine', a='apple')) 
# By name tag
# pen pineapple apple pen

import math
print('The value of pi is approximately {:.5f}.'.format(math.pi))
# The value of pi is approximately 3.14159.

print('This is {:.0%} luck and {:.0%} skill.'.format(0.1, 0.2))
# This is 10% luck and 20% skill.

# Starting in Python 3.6, we can use formatted string literal i.e.
# f-string instead of format().

import math
print(f'The value of 2 * pi is approximately {2 * math.pi:.5f}.')
# The value of 2 * pi is approximately 6.28319.


# 3.8 Pickle

# The pickle module is used to store Python objects in file
# (similar to save() and load() in R).

import pickle

x = {'Mulder', 'Scully'}
with open('x.pkl', 'wb') as f: # Use "with" to open a file in binary write 
    pickle.dump(x, f)          # "wb" mode
                               # Dump the data x onto the file handle f

# The usage of with is recommended in Python to open a file so it will be
# closed automatically afterward, even if the program stops suddenly
# e.g. encounters an error.

import pickle
with open('x.pkl', 'rb') as f:  # Open the file in binary read-only "rb" mode
    x = pickle.load(f)          # Not necessarily the same var name
print(x)                
# {'Scully', 'Mulder'}

# Although it is possible to dump multiple objects onto one file using
# pickle(), it is easier to put the multiple objects in a dictionary and
# dump the dictionary

x = [0, 1, 2, 3, 4]
y = {'Alice': 3, 'Bob': 5}
data ={'x':x, 'y':y}

import pickle
with open('data.pkl', 'wb') as f:
    pickle.dump(data, f)

with open('data.pkl', 'rb') as f:
    data = pickle.load(f)
    
print(data['y'])
# {'Alice': 3, 'Bob': 5}


# 3.9 IF Statement

# The IF statement in Python is similar to other modern programming 
# languages. However, unlike in R:
    # 1. No need for parentheses (...) in each condition
    # 2. Use colon : and 4-space indentation for each code block.
    # No need to use {...}. Therefore, exact indentation is important.
    # 3. The ELSE IF syntax is elif and not else if (for R) or elseif
    # (for MATLAB).

x = 3
if x < 0:
    print('x is negative.')
elif x == 0:
    print('x is zero')
else:
    print('x is positive')
# x is positive
    
# Be careful of proper 4-space indentation for nested IF statements.

a, b, c = 1, 2, 3
if a > b:
    if a > c:
        largest = a
    else:
        largest = c
else:
    if b > c:
        largest = b
    else:
        largest = c
print(largest)
# 3

# Conditional expression for simple IF ELSE statement of the following
# form is useful for writing compact code.
apple = 3
orange = 5

if apple > orange:
    answer = 'apple'
else:
    answer = 'orange'
print(answer)
# orange

answer = 'apple' if apple > orange else 'orange' # One-line equivalent code
print(answer)
# orange

# In python, the boolean False is not the only value that is considered
# false. Other false values include None, any number zero, and any
# empty sequence or dictionary.
# For example, it is not Pythonic to check if a data container x is
# empty using len(x) == 0. Just evalute the object x as a boolean expression.

tummy = []
if not tummy: # Pythonic
    print('tummy is empty')
# tummy is empty
    
tummy.append('breakfast')
if tummy:
    print('tummy is not empty')
# tummy is not empty

# Built-in functions: all() and any() for sequence
# It is Pythonic: to use a dictionary to act as a switch statement instead
# of using an IF statement.

# Not Pythonic
x = 'Elmo'
if x == 'Elmo':
    print('Elmo is red.')
elif x == 'Cookie Monster':
    print('Cookie Monster is blue.')
elif x == 'Kermit':
    print('Kermit is green.')
# Elmo is red.
    
# Pythonic
    
sesame = {'Elmo':'red',
          'Cookie Monster':'blue',
          'Kermit':'green'}
x = 'Elmo'
print('{} is {}.'.format(x, sesame[x]))
# Elmo is red.

x = 'Kermit'
print('{} is {}.'.format(x, sesame[x]))
# Kermit is green.


# 3.10 FOR and WHILE Loop

# The FOR loop in Python is similar to that in R in which it can loop over
# any sequence. However, unlike in R:
    # 1. No need for parantheses (...) to enclose the sequence
    # 2. Use colo : and 4-space indentation for the code block. No need to
    # use {...}. Therefore, exact indentation is important.
# Here is a simple FOR loop using the range() function to traverse a 
# sequence of integers from 0 to 4 i.e. before and not including 5. Note
# the usage of string formatting, conditional expression, and true value.

for i in range(5):
    print('{} is {}'.format(i, 'odd' if i % 2 else 'even'))
# 0 is even
# 1 is odd
# 2 is even
# 3 is odd
# 4 is even

print(i) # No indentation means outside of the FOR loop
# 4

# The loop variable i does not need to be defined ahead of time. Moreover,
# it continues to exist and have the latest value when the loop exits
# (similar ot R).
# Technically, the range(n) function does not construct the entire sequence
# from 0 to n-1 at once. Instead, it returns the next integer whenever the
# FOR loop finishes the previous iteration and asks for the next object. This
# is memory efficient. In Python's terminology, it is an iterator. 
# A list is a sequence and hence can be looped over directly.

prime = [2, 3, 5, 7, 11]
total = 0
for x in prime:
    total += x
print('Sum of the {} smallest prime numbers is {}.'.format(len(prime), total))
# Sum of the 5 smallest prime numbers is 28.

# Nested FOR loops: An inner loop can depend on an outer loop.

sentence = 'Half of a Christmas tree.'
for word in sentence.split(): # Pythonic
    counter = 1
    for char in word: # A string is a sequence
        print(char * counter)
        counter += 1

# A dictionary can be looped over either directly or by using keys(),
# values(), or items(). Note that a dictionary is unordered and the
# ordering of the resulting iterations is arbitrary. Your program should
# not assume or depend on a particular ordering.

sesame = {'Elmo':'red', 'Cookie Monster':'blue'}

for k in sesame: # Same as sesame.keys()
    print('{} is {}.'.format(k, sesame[k]))
# Elmo is red.
# Cookie Monster is blue.

for v in sesame.values():
    print('Someone is {}.'.format(v))
# Someone is red.
# Someone is blue.

for k, v in sesame.items(): # Note the unpacking from 2-tuple to (k,v)
    print('{} is {}'.format(k,v))
# Elmo is red.
# Cookie Monster is blue.
    
# Exercise: Count the number of occurences of each word in the text and print
# the most frequently occured word. (Hint: Use a dictionary.)

text = """
Alice was beginning to get very tired of sitting by her sister on the
bank and of having nothing to do Once or twice she had peeped into the
book her sister was reading but it had no pictures or conversations in
it and what is the use of a book thought Alice without pictures or
conversations

So she was considering in her own mind as well as she could for the
day made her feel very sleepy and stupid whether the pleasure of
making a daisy-chain would be worth the trouble of getting up and
picking the daisies when suddenly a White Rabbit with pink eyes ran
close by her

There was nothing so very remarkable in that nor did Alice think it so
very much out of the way to hear the Rabbit say to itself Oh dear Oh
dear I shall be too late But when the Rabbit actually took a watch
out of its waistcoat-pocket and looked at it and then hurried on Alice
started to her feet for it flashed across her mind that she had never
before seen a rabbit with either a waistcoat-pocket or a watch to take
out of it and burning with curiosity she ran across the field after
it and was just in time to see it pop down a large rabbit-hole under
the hedge In another moment down went Alice after it
"""

x = dict()
count = 0

for word in text.split():
    if word in x:
        x[word] += 1
    else:
        x[word] = 1

largest = 0
for k,v in x.items():
    if v > largest:
        word = k
        largest = v

count = largest
print(word, count)
# the 12

# The WHILE loop in Python is similar to that in R. However, unlike in R:
    # 1. No need for parantheses (...) to enclose the staying condition
    # 2. Use colon : and 4-space indentation for the code block. No need
    # to use {...}. Therefore, exact indentation is important.
# Here is a simple WHILE loop to pop each of the last element of a list and
# print it. Note the syntax to check the emptiness of a list.

x = [1, 2, 3, 4, 5]
while x: # Pythonic
    print(x.pop())
# 5
# 4
# 3
# 2
# 1
    
# The break keyword allows you to exit immediately from a loop (similar to R).
# The continue keyword allows you to skip the rest of the code block and
# jump immediately to the beginning of the next section
# The built-in function reversed() is useful for traversing a sequence in
# reverse ordering. Note that it does not actually create a copy of the
# reversed sequence; it merely creates an iterator which tells Python to 
# traverse from the end.

x = [1, 2, 3, 4, 5]
for v in reversed(x):
    print(v)
# 5
# 4
# 3
# 2
# 1
    
# The built-in function enumerate(..., start=...) is useful for traversing
# a sequence along with the sequence 0, 1,...

sesame = {'Elmo':'red', 'Cookie Monster':'blue'}
for i, k in enumerate(sesame):
    print('{}. {} is {}.'.format(i, k, sesame[k]))
# 0. Elmo is red
# 1. Cookie Monster is blue

sentence = 'Half of a Christmas tree.'
for word in sentence.split():
    for i, char in enumerate(word, 1): # Avoid a separate counter
        print(char * i)


# 3.11 Zipping and Unzipping

# Zipping: Combine two (or more) sequences of the same length together
# as a single sequence of 2-tuple (or k-tuple).
# This is very useful for looping through multiple sequences together.

x = [1, 2, 3, 4, 5]
y = [10, 20, 30, 40, 50]
stuff = list(zip(x, y)) # Need to convert to list due to technicality
                        # Not the same as zip([x, y])
print(stuff)
# [(1, 10), (2, 20), (3, 30), (4, 40), (5, 50)]

# Since the built-in function zip() can combine two or more sequences 
# together, it is useful for traversing multiple sequences together.

price = [11.99, 1.19, 4.99, 2.49]
quantity = [1, 3, 10, 5]
discount = [0.8, 0.9, 0.85, 1]

cost = 0
for p, q, d in zip(price, quantity, discount):
    cost += p * q * d
print(cost)
# 67.67


# 3.12 Itertools

# The Python module itertools provides additional functions for 
# advanced iteration.
# For example, the itertools.cycle() function cycles through a sequence
# of objects indefinitely. In the following example, note that it is the
# ending of range(n) that also stops the cycling.

import itertools

n = 10
expr = ''
answer = 0
for x, s in zip(range(n), itertools.cycle([-1, 1])):
    expr += (' + ' if s == 1 else ' - ') + str(x)
    answer += s * x

print('{} = {}'.format(expr[3:], answer))
# 0 + 1 - 2 + 3 - 4 + 5 - 6 + 7 - 8 + 9 = 5

# For example, the itertools.product() function constructs a cartesian product
# of all possible tuples from multiple sequences. This is useful for avoiding
# writing deeply nested FOR loops.

import numpy as np
m = np.random.normal(size=(2, 3, 4))
print(m.sum())
# 2.4547214577294003

import itertools
total = 0
for i, j, k in itertools.product(range(2), range(3), range(4)):
    total += m[i, j, k]
print(total)
# 3.416741089917887


# 3.13 Comprehension

# Comprehension is a special syntax in Python to construct a list, a dictionary
# or a set based on FOR loops in a concise way. 
# The simplest syntax is to construct a list as the outputs of a FOR loop.
# The enclosing square brackets [... for ...] indicates that the resulting
# object is a list.

square = [x ** 2 for x in range(10)]
print(square)
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

square = []
for x in range(10):
    square.append(x ** 2)

# The expression for the outputs of a comprehension does not necessarily
# need to be a single value.

import math
print([(x, round(math.log(x ** 2), 2)) for x in range(1, 10)])
# [(1, 0.0), (2, 1.39), (3, 2.2), (4, 2.77), (5, 3.22), (6, 3.58), (7, 3.89), 
# (8, 4.16), (9, 4.39)]

# Use an IF statement to further filter the outputs of a comprehension.

odd = [x for x in range(10) if x % 2 == 1]
print(odd)
# [1, 3, 5, 7, 9]

odd = []
for x in range(10):
    if x % 2 == 1:
        odd.append(x)
print(odd)

# Exercise: Extract all of the values in the list x that are also in the
# set y.

x = [1, 3, 4, 3, 2, 0]
y = [1, 2, 3]
answer = [x[num] for num in range(len(x)) if x[num] in y]
print(answer)
# [1, 3, 3, 2]

answer = []
for num in range(len(y)):
    if y[num] in x:
        answer.append(y[num])
print(answer)

# Comprehension can also be used with nested FOR loops.

n = 5
upper_index = [(i, j) for i in range(n) for j in range(i, n)]
print(upper_index)
# [(0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (1, 1), (1, 2), (1, 3), (1, 4), 
# (2, 2), (2, 3), (2, 4), (3, 3), (3, 4), (4, 4)]

upper_index = []
for i in range(n):
    for j in range(i, n):
        upper_index.append((i, j))

# Exercise: Construct a list named deck to represent the 52 poker cards.
n = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
suits = ['S', 'H', 'C', 'D']
deck = [(n[i]+suits[num]) for num in range(len(suits)) for i in range(0, len(n))]
print(deck)

# Use the dictionary notation {key:value for ...} for dictionary comprehension.

name = ['Elmo', 'Cookie Monster']
sesame = {x: len(x) for x in name}
print(sesame['Elmo'])
# 4

# use the set notation {value for ...} for set comprehension.
donation = [('Alice', 3), ('Bob', 17), ('Alice', 5)]
donar = {name for name, _ in donation}
print(donar)
# {'Alice', 'Bob'}

donar = set()
for name, _ in donation: # Unpacking
    donar.add(name)
print(donar)

# Recall that if x is a list, then list(set(x)) is the Pythonic way to
# construct a list of distinct elements of x. But this approach is not
# order-preserving.

x = [1, 4, 2, 3, 2, 5, 3, 1]
x = list(set(x))
print(x)
# [1, 2, 3, 4, 5]

# Here is a net way to construct an order-preserving list of unique elemnts
# Note that it takes advantage of the short-circut behavior of and and that
# the function seen.add() returns None.

x = [1, 4, 2, 3, 2, 5, 3, 1]
seen = set()
x = [v for v in x if v not in seen and not seen.add(v)]
print(x)
# [1, 4, 2, 3, 5]

# Here is the equivalent logic more explicitly without list comprehension.

x = [1, 4, 2, 3, 2, 5, 3, 1]
seen = set()
unique_x = []
for v in x:
    if v not in seen:
        unique_x.append(v)
        seen.add(v)
print(unique_x)


# 3.14 Homework

# 1. Write some Python code to print a string sentence in the following way. 
# (Hint: It might be useful to know the longest word first.)

sentence = 'The whole Christmas tree.'
largest = 0

for word in sentence.split():
    if len(word) > largest:
        largest = len(word)
# 9

for word in sentence.split():
    for i, char in enumerate(word, 1):
        print(' ' * (largest-i) + char * i * 2) 

#         TT
#        hhhh
#       eeeeee
#         ww
#        hhhh
#       oooooo
#      llllllll
#     eeeeeeeeee
#         CC
#        hhhh
#       rrrrrr
#      iiiiiiii
#     ssssssssss
#    tttttttttttt
#   mmmmmmmmmmmmmm
#  aaaaaaaaaaaaaaaa
# ssssssssssssssssss
#         tt
#        rrrr
#       eeeeee
#      eeeeeeee
#     ..........


# 2. Write some Python code to implement the following scheme to derive an 
# integer value answer from a string s:
    # Each English character 'a' and 'A' has value 1, 'b' and 'B' has 
    # value 2, …, 'z' and 'Z' has value 26
    # Each non-English character has value −1
    # The final answer is the total value of all characters in s.
# (Hint: Use a dict() as a look-up table.)

s = "Isn't it amazing?"
alpha = {'a':1, 'b':2, 'c':3, 'd':4, 'e':5, 'f':6, 'g':7, 'h':8, 'i':9, 'j':10,
         'k':11, 'l':12, 'm':13, 'n':14, 'o':15, 'p':16, 'q':17, 'r':18, 's':19,
         't':20, 'u':21, 'v':22, 'w':23, 'x':24, 'y':25, 'z':26}

answer = 0
for char in s.lower():
    if char in alpha:
        answer += alpha[char]
    elif char not in alpha:
        answer += -1

answer
# 158


# 3. Write some Python code to implement the following scheme to convert a 
# natural number x into a value answer in {1,..,9}:
    # 1. Sum up the individual digits of x e.g. 123456 
    # becomes 1+2+3+4+5+6=21
    # 2. If the result of Step 1 is not a single digit yet, then 
    # re-repeat Step 1 to this result too.
    # 3. Repeat until the result is a single digit. This is the answer.
# For example, 123456→21→3. (Hint: The Python built-in str() and int() 
# functions might be useful for conversion.)
    
x = 123456

def sum_func(x):
    str_x = str(x)
    answer = 0
    for i in range(0,len(str_x)):
        answer += int(str_x[i])
    return answer

y = len(str(sum_func(x)))

while y > 1:
    x = sum_func(x)
    y = len(str(x))

answer = sum_func(x)
answer
# 3


# 4. We can view the scheme in Question 3 above as a hash function that 
# maps each natural number to one of 9 buckets indexed by {1,..,9}. How 
# evenly-distributed is this hash function? To find out, apply this hash 
# function to all natural numbers up to 1000 and report the number of 
# elements in each bucket.

def num_conv(x):
    y = len(str(sum_func(x)))

    while y > 1:
        x = sum_func(x)
        y = len(str(x))
    
    return(sum_func(x))
    
num_conv(x)

hash_store = {}
for i in range(1, 1000):
    if num_conv(i) not in hash_store:
        hash_store[num_conv(i)] = 1
    hash_store[num_conv(i)] += 1

hash_store







