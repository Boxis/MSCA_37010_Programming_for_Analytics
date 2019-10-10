## 5.1 Function

# Use a function to encapsulate a block of code so that:
  # you have functionality that is reusable 
  # break lengthy code into smaller logical components
  # easier to isolate, test, debug, modify your code

# Typical components of a function are:
  # 1. keyword function and parentheses ()
  # 2. (Optional) One or more input arguments inside ()
  # 3. A block of one or more lines of code inside {}
  # 4. (Optional) A return value and the keyword return

# A function needs to be defined first before it can be "called"

# Example: a function stored inside object "squaring"
squaring <- function(x) {
  return(x * x)
}

# Use the functionality by calling "squaring"
squaring(3)

# [1] 9


# A function can have no input argument
today.is.wednesday <- function() {
  return(weekdays(Sys.Date()) == "Wednesday")
}

today.is.wednesday()

# [1] TRUE


# A function can have multiple input arguments
quadratic.root <- function(a, b, c) {
  # Solve f(x) = ax^2 + bx + c = 0 for x
  d <- b^2 - 4*a*c
  return((-b + c(-sqrt(d), sqrt(d))) / (2 * a))
}

quadratic.root(2, -14, 24)

# [1] 3 4


# A function can have no output
say.word <- function(word) {
  cat(word) # Show the word on the console directly
}

say.word("Hello")

# Hello


# A function can have essentially multiple outputs by using the trick
# that returns a list
five.number.summary <- function(x){
  m1 <- min(x)
  q1 <- quantile(x, 0.25, names=FALSE)
  q2 <- median(x)
  q3 <- quantile(x, 0.75, names=FALSE)
  m2 <- max(x)
  return(list(minimum=m1, first.quartile=q1, mdian=q2, third.quartile=q3,
              maximum=m2)) # Put all stuff in a list and return list
}

x <- c(0.6, 1.7, 0.4, -0.3, 0.2, -0.2, -1.5, 1.6, 1.5)
result <- five.number.summary(x)
# $minimum
# [1] -1.5

# $first.quartile
# [1] -0.2

# $median
# [1] 0.4

# $third.quartile
# [1] 1.5

# $maximum
# [1] 1.7

result$first.quartile
# [1] -0.275


# In R, the return keyword is optional. value of last expression is
# returned
squaring <- function(x) {
  x * x
}

squaring(3)
# [1] 9


# return keyword is used to exit function early
# Example: two logically equivalent ways to implement any()
# functionality
annie <- function(x) {
  answer <- FALSE
  for(value in x) {
    if(value) {
      answer <- TRUE
      break
    }
  }
  return(answer) # Only exit the function here
}

annie <- function(x) {
  for(value in x) {
    if(value) {
      return(TRUE) # can exit the function early
    }
  }
  return(FALSE)
}

# if you use return() without any value inside(), it will return NULL


# Exercise: Write R function that takes a number score between 0 and 100
# as argument and returns a letter grade according to table

grading <- function(score) {
  if(score >= 90){
    letter.grade <- "A"
  } else if (score >= 80) {
    letter.grade <- "B"
  } else if (score >= 70) {
    letter.grade <- "C"
  } else if (score >= 60) {
    letter.grade <- "D"
  } else if (score >= 50) {
    letter.grade <- "E"
  } else {
    letter.grade <- "F"
  }
  return(letter.grade)
}

(letter.grade <- grading(83))
# [1] "B"


# There are two simple ways to reuse functions that exist
  # 1. Copy and paste function code directly into file of current code
  # 2. Save function code in another file, and source() it in your 
  # current code.


## 5.2 Default, Named, and Missing Argument 
  # Default argument: A convenient feature in R that allows you to pre-assign a
  # specific value to an argument of a function. The value is in effect unless
  # the user who calls the function overwrites the value explicitly.
  # Use default argument when a function has a commonly used case but you still
  # want to keep it flexible enough for general usage


vector.norm <- function(x, p=2){
  return(sum(abs(x)^p)^(1/p))
}

x <- c(-1, 0, 2)

vector.norm(x) # no need to specify p
vector.norm(x, 2)
vector.norm(x, 1)
vector.norm(x) # Note that p is not set to 1

#[1] 2.236068
#[1] 2.236068
#[1] 3
#[1] 2.236068


# Use default argument when you want to expand the functionality of an existing 
# function beyond its original intent while maintaining the old interface for 
# backward compatibility

vector.norm <- function(x){ # Can only compute L2-norm
  return(sqrt(sum(x^2)))
}

x <- c(-1, 0, 2)
vector.norm(x)

vector.norm <- function(x, p=2){ # Adding new functionality
  return(sum(abs(x)^p)^(1/p))
}

vector.norm(x) # Same interface so the old function call still works.

# [1] 2.236068
# [1] 2.236068


# Named argument: Allow you to specify the values of some specific arguments
# of a function more explicitly without relying on the position of the argument

f <- function(x, a=1, b=2) {
  return((x + a) * b)
}

f(10)
f(10, 3, 4)
f(10, a=3)
f(10, b=4)

# [1] 22
# [1] 52
# [1] 26
# [1] 44

# Since there is no ambiguity in which argument a named value should be matched 
# with, you can put named arguments not in the original ordering that is 
# specified by the function.
# Naming argument matching rules:
  # 1. Match those arguments with complete names
  # 2. Match those arguments with partial but unambiguous names
  # 3. Match the unnamed arguments in sequential order

f <- function(alice, andy, anna, bob){
  return(c(alice, andy, anna, bob))
}

f(1, 2, 3, 4)
f(bob=1, andy=2, 3, 4)
f(1, b=2, al=3, 4)
# f(1, an=2, al=3, 4) # Error

#[1] 1 2 3 4
# [1] 3 2 4 1
# [1] 3 1 4 2


# Built-in R functions: match.arg(), missing()
# How to read R's documentation e.g. ?mean, ?sample, ?paste

# Below is a useful function to generate a password randomly given a set of 
# character choices.

random.password <- function(n, choice=c(letters, LETTERS)) { # See ?letters
  password <- paste(sample(choice, n, replace=TRUE), collapse = "")
  return(password)
}

random.password(10) # Use default argument
random.password(10, 0:9) # Use {0, ..., 9} instead of alphabets

# [1] "dMaHwQnrYG"
# [1] "4495968448"

  # Missing argument: R would not comlpain about a missing argument if it is not
  # being used (thanks to lazy evaluation nature of R)

f <- function(x, a=2, b){
  if(a == 2) {
    return(x + a)
  } else {
    return((x + a) * b)
  }
}

f(10)
# f(10, a=3) # Error
f(10, a=3, b=4)

# [1] 12
# [1] 52


## 5.3 Variable Scope

# The scope of a variable refers to the part of th ecomputer program where
# the association of a value to a variable is valid.
# Global and local variable
# Function argument as call-by-value (not entirely true but good enough)
# Draw a picture about memory management

# When all variables have different names, the situation is quite clear

x <- 3 # Global variable

twice <- function(y){
  # here is a local variable
  return(2 * y)
}

twice(x)
# [1] 6

y # Error: object 'y' not found


# Variable shadwoing: The name of the global variable is masked by the local
# variable with the same name. In this case, the local variable is
# in-scope and the global variable is out-of-scope.
# This is important because it alows the programmer of a function to not
# worry about name collision with any existing global variables.

x <- 3

twice <- function(y) {
  x <- y + 1 # Create a separate local variable x which is masking the 
  # global variable x.
  cat("twice x is", x, "\n")
  return(2 * y)
}

twice(x)

cat("global x is", x, "\n")
# twice x is 4
# [1] 6
# global x is 3

x <- 3

twice <- function(x) {
  x <- 2 * x
  cat("twice x is", x, "\n")
  return(2 * x)
}

twice(x)

cat("global x is", x, "\n")
# twice x is 6
# [1] 12
# global x is 3


# Name resolution and name binding: It is the process of identifying the
# value that a variable name refers to.
# If R cannot find the value of a variable in the current scope, then
# it looks up the value in the previous scope. R repeats this process until
# it either finds the value or throws an error if R cannot find any value.

add.x <- function(y) {
  return (y + x) # Note that x is not defined inside the function
}

x <- 3
add.x(10)

x <- 4
add.x(100)

# [1] 13
# [1] 104


# Exercise: Explain the output of the following R program. Draw a picture
# of the memory management.

# A global variable is created.
x <- 1

f <- function() {
  # function f cannot find local variable x, so it goes outside to global
  # scope, finds global x and uses it
  cat("before x is", x, "\n")
  
  # value of global variable is copied and 10 is added to it.
  # it is then saved as a local variable x inside the function f
  # doesn't change the value of the global variable.
  x <- x + 10
  
  # any subesquent x will use the local variable
  # local variable "shadows" the global variable with same name
  cat("after x is", x, "\n")
  return(x)
}

f()
cat("outside x is", x, "\n")
# before x is 1
# after x is 11
# [1] 11
# outside x is 1


## 5.4 Function as Argument and Return
# A higher-order function is a function that either takes another function
# as an input argument or return an output that is a function.

# For example, the following R program mimics R's built-in apply()


apply.some.f <- function(m, f, do.row=TRUE) { # Here m is a matrix
  # f is function
  if(do.row){
    num.row <- nrow(m)
    answer <- vector(typeof(m), num.row)
    for(i in 1:num.row){
      answer[i] <- f(m[i,]) # Apply f to the i-th row of m.
    }
  } else {
    num.col <- ncol(m)
    answer <- vector(typeof(m), num.col)
    for(i in 1:num.col){
      answer[i] <- f(m[,i]) # Apply f to the i-th column of m.
    }
  } 
  return(answer)
}

m <- matrix(1:10, nrow=2, ncol=5)
m
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

apply.some.f(m, sum)
apply.some.f(m, mean, do.row=FALSE)
# [1] 25 30
# should be # [1] 1.5 3.5 5.5 7.5 9.5


# In the apply.some.f() function above, is there a better way to code
# without it assuming that the output of f() has the same data type as
# m? Use typeof(fm[1,])) (and similarly if do.row=FALSE). But if we rely
# on an extra function call of f(), then what if each function call of
# f() takes a long time to run. Can we avoid it?

# Exercise: Numerical differentiation is an approximation of the
# derivative of f'(x) of a function f(x) at a given point x without
# actually differentiating the function symbolically. A common technique
# is to use finite difference methods such as symmetric difference 
# quotient i.e.

# f'(x) = (f(x + h) - f(x - h)) / 2h
# for some small h >0.

# Write an R function derivative() that takes a function f and a point x 
# as arguments and returns its derivative f'(x) at x.

derivative <- function(f, x, h=1e-5){
  answer <- (f(x + h) - f(x - h)) / 2*h
  return(answer)
}

# Define some arbitrary function f to test.
f <- function(x) {
  return(3 * x^2 + 4*x +5)
}

derivative(f, 0.7)
# [1] 8.2



# A fucntion can be returned from another function too; just like a
# variable. In this case, all related info and variables used by the
# output function is contained in a closure which is also returned 
# together.
# Draw a picture to illustrate the memory management of closure.

# For exmaple, below is a "function factor" that makes a function that 
# would exponentiate its input to a specific predefined power.

power.factory <- function(k){
  # Define a function f which depends on k
  f <- function(x){
    return(x^k)
  }
  # Return f along with its closure (which contains k)
  return(f)
}

square <- power.factory(2)
square # The extra environment represents closure
# function(x){
#   return(x^k)
# }
# <environment: 0x000000000ca3d958>
square(2)
# [1] 4
square(3)
# [1] 9

cube <- power.factory(3)
cube
cube(2)
cube(3)
# function(x){
#  return(x^k)
# }
# <bytecode: 0x000000000cf6a990>
#   <environment: 0x000000000ce29088>

# [1] 8
# [1] 27

# To peek into the enclosing environment of a function that has a closure,
# use the environment() function

as.list(environment(square))
# $f
# function (x) 
# {
#   return(x^k)
# }
# <environment: 0x000000000ca3d958>

#   $k
# [1] 2


# Exercise: Write an R function differentiate() that takes a function f
# as argument and returns its derivative (as an R function).

differentiate <- function(f, h=1e-5){
  a <- function(x){
    return ((f(x+h) - f(x-h)) / 2 * h)
  }
  return(a)
}

f <- function(x){
  return (3 * x^2 +4*x +5)
}

df.dx <- differentiate(f)
df.dx
df.dx(0)
df.dx(0.7)
df.dx(1.5)

# [1] 4
# [1] 8.2
# [1] 13

# Since the differentiate() function takes a function as input and outputs
# a fucntion, we can chain this operation together to calculate
# higher-order derivaties too.

f <- function(x){
  return (3 * x^2 + 4*x + 5)
}

d2f.dx2 <- differentiate(differentiate(f)) # Second-derivative
d2f.dx2(0) # Some numerical inaccuracy
d2f.dx2(0.7)
d2f.dx2(1.5)

# [1] 5.999998
# [1] 6
# [1] 6


## 5.5 Homework

# 1. Write an R function newton.raphson() to implement the Newton-Raphson root
# finding method algorithm. It should:
  # Take a function f and an initial value x0 as arguments
  # Take the optional arguments iter for maximum number of iterations (with 
  # default value of 10^5) and epsilon for the tolerance (with devault value
  # of 10^-10)
  # NOT hard-code the derivative f'(x) of a particular function f(x) inside
  # newton.raphson(). Instead, the derivative should be computed from f in
  # real-time so that the code could work for any input argument f
  # The "inside" of the newton.raphson() function should only depend on the
  # input arguments to the function. In other words, it should NOT depend on
  # any variable that is "outside" of the function.
  # (Hint: Reuse any previously written codes as much as you can.)

differentiate <- function(f, h=1e-5){
  a <- function(x){
    return ((f(x+h) - f(x-h)) / 2 * h * 1e10)
  }
  return(a)
}

newton.raphson <- function(f, x0, iter=1e5, epsilon=1e-10) {
  # ... Skipped code ...
  t <- 0 # Use a counter to keep track of the number of iterations so far.
  x.old <- x0
  
  derivative <- differentiate(f)
    while (TRUE) {
      t <- t + 1
      x.new <- x.old - f(x.old) / derivative(x.old)
      if (abs(x.new - x.old) < epsilon || t == iter) {
        break
      }
      x.old <- x.new
    }
  root <- x.new
  return(root)
}

# Define some function to test
f <- function(x) {
  return(x^2 - 4 * x - 7)
}

newton.raphson(f, 0)
newton.raphson(f, 3)

# [1] -1.316625
# [1] 5.316625



