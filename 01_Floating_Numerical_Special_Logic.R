## MSCA 37010 Programming for Analytics
## Lecture 1

## 1.1 Floating Point
str(1)

x <- numeric(5)
str(x)

10^100


## Numerical Inaccuracy
10^100 + 1 == 10^100 # might forget about smaller digit positions

1/3 * 3/5 == 1/5
(1/3) * (3/5) == 1/5
.Machine$double.eps

1/3

    ## always compare two floating-point numbers for equality up to some small
    ## tolerance only
(1/3) * (3/5) - 1/5
abs((1/3) * (3/5) - 1/5) < 1e-10 # tolerance of 1e-10 usually works

k <- 308
10^k < Inf && 10^(k+1) == Inf

x <- 1e-16
x != 0 && 1 + x == 1


## 1.3 Special Values
1e500
1/0

# NaN is "not a number"
Inf - Inf
Inf * 0
0/0 + 1

# NA is a special value in R to rep a missing value
student <- list(name="Alice", grade=NA)

# NULL is a reserved keyword in R to rep the null object in R
length(NULL)


## Boolean Logic

# Comparison: ==, >, <, !=, <=, >=
1 < 2

# Boolean opeartors: ;! NOT, && AND, || OR
!TRUE
!FALSE
TRUE && FALSE
TRUE || FALSE

(5 >= 4) && (1 != 2)

(x > 0) && (x %% 1 == 0)

# Operator precedence, ! NOT evaluated first, then && AND and || OR
TRUE || TRUE && !TRUE # same as TRUE || (TRUE && (!TRUE))
(TRUE || TRUE) && (!TRUE)

1:5 + 2
(1:5) + 2
1:(5+2)

# Exercise:  without executing code, what is value of following expressions?
2 ** 3 ** 4
TRUE || TRUE && TRUE && FALSE
1 -- 1 == 1 ++ 1 # (1 - (-1)) == (1 + (+1))

# Built-in functions for logical vector: all(), any(), which()
x <- c(TRUE, FALSE, FALSE, TRUE)
all(x)
any(x)
which(x)

# Vectorized AND and OR: &, |
x <- c(TRUE, TRUE, FALSE)
y <- c(TRUE, FALSE, FALSE)
x & y
x | y

x <- 1:10
x[x < 5 & x > 7]
x[x < 5 | x > 7]


## IF Statement
x <- -2
if(x < 0){
    x <- -x
}

# bad style
if(x<0){x<- -x}

# can omit curly brackets {} if block of code only one line
x <- -2
if(x < 0)
    x <- -x
x

# IF ELSE statement, exactly one of the two code blocks will be executed
x <- 1
y <- 2
if(x < y){
    answer <- y
} else {
    answer <- x
}
answer

# Nesting IF ELSE statements: it can be nested inside a code block of another
# IF ELSE
x <- 2
if(x < 0){
    answer <- -1
} else {
    if(x == 0) {
        answer <- 0
    } else {
        answer <- 1
    }
}
answer

# Exercise: write r script, that takes vector of 3 numbers and returns 
# their max value, use IF statements not max()

# Solution
x <- c(3, 7, -2)
if(x[1] > x[2]){
    if(x[1] > x[3]){
        answer <- x[1]
    } else {
        answer <- x[3]
    }
} else {
    if(x[2] > x[3]){
        answer <- x[2]
    } else {
        answer <- x[3]
    }
}
answer

# IF ELSEIF ELSE
x <- 2
if(x < 0){
    answer <- -1
} else if (x == 0) {
    answer <- 0
} else {
    answer <- 1
}
answer

# You can have multiple ELSEIF statements, ELSE is always optional
x <- 36
if (x %% 2 == 0 && x %% 3 == 0) {
    print("This x is divisble by 2 and 3.")
} else if (x %% 2 == 0) {
    print("This x is divisible by 2 but not 3.")
} else if (x %% 3 == 0) {
    print("This x is divisible by 3 but not 2.")
}

# Ordering of IF, ELSE IF, and ELSE matters
x <- c(1, -2, -3, 4, 5)
answer <- ifelse(x %% 2 == 0, "even", "odd") # Vectorize
answer

# Exercise: write a program to check if a number xx is a perfect square
# if there exists an integer yy such that y^2 = xy^2 = x

# Solution
x <- 121
if (x < 0) {
    answer <- FALSE
} else {
    y <- sqrt(x)
    if (y %% 1 == 0) {
        answer <- TRUE
    } else {
        answer <- FALSE
    }
}
answer

# Simplify the program
x <- 121
if (x < 0) {
    answer <- FALSE
} else {
    y <- sqrt(x)
    answer <- y %% 1 == 0
}
answer

# Simplify more
x <- 121
answer <- x > 0 && sqrt(x) %% 1 == 0
answer


## 1.6 Homework

# 1.
x <- c(0.07, -0.42, 0.48, -0.14, 0.20, -0.44, 0.27, 0.05)
answer <- mean(x > 0)
answer
# converts values to 1 or 0, and calc the binary average 

positive.avg <- mean(x[x > 0])
positive.avg

# 2.
x <- 1:10
x
dim(x) <- c(2, 5)
x
dim(x) <- c(5, 2)
x
dim(x) <- NULL
x
# matrix is just a vector with additional info about its dimensions

# 3. Create the following matrix.

#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    2    3    4    5
# [2,]    2    2    3    4    5
# [3,]    3    3    3    4    5
# [4,]    4    4    4    4    5
# [5,]    5    5    5    5    5

m <- matrix(5, 5, 5)
m[1:4, 1:4] <- 4
m[1:3, 1:3] <- 3
m[1:2, 1:2] <- 2
m[1,1] <- 1
m

# 4. takes a number score between 0 and 100
#    output a letter grade accoridng to following table

# Score
# Letter    Grade
# 90 - 100      A
# 80 - 89       B
# 70 - 79       C
# 60 - 69       D
# 50 - 59       E
# 0 - 49        F

grade <- function(x) {
    if (x >= 90){
        answer <- "A"
    } else if (x >= 80) {
        answer <- "B"
    } else if (x >= 70) {
        answer <- "C"
    } else if (x >= 60) {
        answer <- "D"
    } else if (x >=50) {
        answer <- "E"
    } else {
        answer <- "F"
    }
    print(answer)
}
grade(83)



