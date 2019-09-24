## Lecture 2
## 2.1 Memory Management: Vector vs List

x <- 1.23 # a variable of double type occupies 64 bits of memory.

x <- seq(0, 1, length.out=10) # occupy a consecutive block of 640 bits of memory.

x <- list(1, "two", matrix(3, 3, 3)) # occupy 3 separate memory locations.

# assign new value to existing variable
x <- c(1, 2, 3)
x <- c(4, 5, 6)

x <- c(1, 2, 3)
x[1] <- 4

x <- list(matrix(2, 2, 2), matrix(3, 3, 3))
x[1] <- "two"

# append additional data to existing vector (or matrix) or list
x <- 1
x <- c(x, 2)
x <- c(x, 3)

x <- list(matrix(2, 2, 2), matrix(3, 3, 3))
x[[3]] <- matrix(4, 4, 4) # only allocate additional memory for the new data

x <- numeric(3) # pre-allocation of entire vector first
x[1] <- 1 # modify in-place
x[2] <- 2
x[3] <- 3

# new variable comes from an existing variable
# always a deep copy

x <- 1
y <- x # a new block of memory is created for a copy of x
x <- 2
x # 2
y # 1

x <- 1:5
y <- x[2:4]
x[3] <- 6
x # 1 2 6 4 5
y # 2 3 4

x <- list(list(a=1), list(b=2))
y <- x[[1]] # it is a (deep) copy no matter how nested it is.
y$a <- 10
x
y

x <- 1:3
y <- x
y[1] <- 10
x
y

## 2.2 FOR Loop
# use when you want to repeat some part of a program multiple times

print(1)
print(2)
print(3)

x <- c(0.28, 1.3, -1.14)
total <- 0
total <- total + x[1]
total <- total + x[2]
total <- total + x[3]
total
 
# main components of a FOR Loop are:
  # 1. for
  # 2. A sequence of data inside ()
  # 3. A variable that stores the current iteration of data
  # 4. in
  # 5. A block of one or more lines of code inside {} to be executed

for (i in 1:3) {
  print(i)
}

x <- c(0.28, 1.3, -1.14)
total <- 0
for (i in 1:length(x)) {
  total <- total + x[i]
}
total

# Exercise: write a FOR loop to mimic built-in R func dif() of vector x

# Solution
x <- c(1, 7, -2, 0, 5)
n <- length(x)
answer <- numeric(n - 1)

for (i in 1:(n-1)){
  answer[i] <- x[i+1] - x[i]
}

answer


# Exercise: FOR Loop to mimic cumsum() function of vector x

# Solution
x <- c(1, 7, -2, 0, 5)
n <- length(x)
answer <- numeric(n)
answer[1] <- x[1]

for (i in 2:n) {
  answer[i] <- answer[i-1] + x[i]
}

answer


# Exercise: FOR Loop to mimic rev() of vector x

# Solution
x <- c(1, 7, -2, 0, 5)
n <- length(x)
answer <- numeric(n)

for (i in 1:n) {
  answer[i] <- x[n - (i - 1)]
}

answer

# without creating another vector called answer
x <- c(1, 7, -2, 0, 5)
n <- length(x)
k <- n %% 2

for(i in 1:k){
  temp <- x[i]
  x[i] <- x[n - (i-1)]
  x[n - (i - 1)] <- temp
}
x


# Exercise: FOR loop to mimic which.max() of vector x. First index is largest
# value

# Solution
x <- c(1, 7, -2, 7, 5)

answer <- 1
for(i in 1:length(x)){
  if(x[i] > x[answer]){
    answer <- i
  }
}
answer

# last index is largest value
x <- c(1, 7, -2, 7, 5)

answer <- 1
for(i in 1:length(x)){
  if(x[i] >= x[answer]){
    answer <- i
  }
}
answer


# Exercise: FOR loop to mimic pmin() of two vectors x and y of the same length

# Solution
x <- c(1, 7, -2, 7, 5)
y <- c(-3, 4, 6, 0, 9)

n <- length(x)
answer <- numeric(n)

for(i in 1:length(x)){
  if(x[i] < y[i]) {
    answer[i] <- x[i]
  } else {
    answer[i] <- y[i]
  }
}
answer


## The index variable:
  # any valid variable name is OK
  # the variable can exist before the FOR loop
  # The variable will continue to exist after the FOR loop
  # You can change the value of the index variable inside the FOR loop. It will 
  # be reset by R at the beginning of the next iteration.

x <- 1
print(x)
for (x in 3:5){
  print(x)
  x <- 10
  print(x)
}
print(x)

# [1] 1
# [1] 3
# [1] 10
# [1] 4
# [1] 10
# [1] 5
# [1] 10
# [1] 10

## The sequence of data inside () can be any sequence of data
  # i.e. vector or list, and not just 1:n

fruits <- c("apple", "banana", "orange", "kiwi")

total <- 0
for(i in 1:length(fruits)){ # Loop over an index
  print(i)
  total <- total + nchar(fruits[i])
}
total

# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 21

fruits <- c("apple", "banana", "orange", "kiwi")

total <- 0
for(fruit in fruits){ # Loop over the data
  print(fruit)
  total <- total + nchar(fruit)
}
total

# [1] "apple"
# [1] "banana"
# [1] "orange"
# [1] "kiwi"
# [1] 21

basket <- list(list(fruit="apple", price=1.99),
               list(fruit="banana", price=0.59),
               list(fruit="orange", price=1.29),
               list(fruit="kiwi", price=0.5))

total.price <- 0
for(item in basket){
  print(item$fruit)
  total.price <- total.price +item$price
}
total.price

# [1] "apple"
# [1] "banana"
# [1] "orange"
# [1] "kiwi"
# [1] 4.37

## The FOR loop itself does not allow you to iterate over two sequences
## simultaneously. So you need to improvise.

fruits <- c("apple", "banana", "orange", "kiwi")

n <- length(fruits)
num.char <- numeric(n)
i <- 1 # Initialize an index.
for(fruit in fruits){
  num.char[i] <- nchar(fruit)
  i <- i + 1 # Increment the index by ourselves.
}
num.char

# [1] 5 6 6 4

## Nested loops i.e. a loop inside a loop

m <- matrix(1:24, 4, 6)

answer <- 0
for(i in 1:nrow(m)){
  for(j in 1:ncol(m)) {
    answer <- answer + m[i,j]
  }
}
answer 

# [1] 300


# Exercise: FOR loop to mimic colMeans() of matrix m.

# Solution

m <- matrix(1:24, 4, 6)
m
num.row <- nrow(m)
num.col <- ncol(m)
answer <- numeric(num.col)
for(i in 1:num.col){
  for(j in 1:num.row){
    answer[i] <- answer[i] + m[j,i]
  }
  answer[i] <- answer[i] / num.row
}
answer

## how to use break keyword to exit early from a FOR loop

x <- c(FALSE, FALSE, TRUE, FALSE, FALSE)

answer <- FALSE # use a flag.
for(value in x){ 
  if(value) { # Same as checking if value == TRUE.
    answer <- TRUE # This is the only way to change the answer.
    break
  }
}
answer


# Exercise: FOR loop with break to mimic all() for vector x

# Solution

x <- c(TRUE, TRUE, TRUE, FALSE, TRUE)
for(i in x){
  if(!i){
    answer <- FALSE
    break
  }
}
answer


## Use next keyword to skip remaining of the code and continue with the next
## iteration of the FOR loop
## two different FOR loop logically equivalent. next might be nicer-looking code

total <- 0
for(x in 1:100){
  if(x %% 7 == 0){
    total <- total + x
  }
}
total

# [1] 735

total <- 0
for(x in 1:100){
  if(x %% 7 != 0){
    next
  }
  total <- total + x
}
total


## 2.3 Homework

# 1. Write a nested FOR loops to obtain the upper triangular matrix of m. In 
# other words, it sets all the elements of m that are below the diagonal to 0. 
# Do not use any IF statement or any R's built-in function such as lower.tri().

d <- 6
m <- matrix(1:(d*d), d, d)
num.row <- nrow(m)
num.col <- ncol(m)

for(i in 2:num.row){
  for(j in 1:(i-1)){
    m[i, j] <- 0
  }
}
m


# 2. Write an R program that takes an atomic variable v and a vector y, and 
# returns TRUE if v is an element of y, and FALSE otherwise. You should use the 
# break keyword somehwere in your code. Do not use any R's built-in function 
# such as is.element() or %in%.

v <- 0
y <- c(-1, 0, 1)

for(i in 1:length(y)){
  if(v == y[i]){
    answer <- TRUE
    break
  } else {
    answer <- FALSE
  }
}
answer


# 3. Write an R program to mimic the built-in R function is.element(x, y) of two
# vectors x and y. In other words, your program returns a vector answer of the 
# same length as x, and answer[i] is TRUE if and only if x[i] is an element of 
# y. (Hint: Use the code from the previous question. Use logical() for 
# initialization.)

x <- c(3, 0, -2, 0)
y <- c(-1, 0, 1)
answer <- logical(length(x))

for(i in 1:length(x)){
  for(j in 1:length(y)){
    if(x[i] == y[j]){
      answer[i] <- TRUE
    }
  }
}
answer





