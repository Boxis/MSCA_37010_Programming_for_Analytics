## 3.1 WHILE LOop
# Use a WHILE loop to repeat something until some stay condition becomes FALSE
# unlike FOR loop, there is usually not a fixed sequence of data to iterate over
# just repeat some task until some exit condition is satisfied
# Main components of WHILE loop are:
    # 1. while
    # 2. A logical expression inside ()
    # 3. A block of one or more lines of code inside {} to be executed

x <- 5
while(x >= 0) {
    print(x)
    x <- x - 1
}

# [1] 5
# [1] 4
# [1] 3
# [1] 2
# [1] 1
# [1] 0

# Exercise: Find smallest integer  kk such that 10^k is Inf
# Use is.finite()

k <- 0
while(is.finite(10 ^ k)){
    k <- k + 1
}
k

# [1] 309

# Sometimes you don't know a priori when the WHILE loop will exit and stop

n <- 5

# Initialize.
history <- c()
num.head <- 0

while(num.head < n){
    coin <- sample(c("H", "T"), 1)
    history <- c(history, coin) # bad to grow a vector in general
    if(coin == "H"){
        num.head <- num.head + 1
    }
}
history

# [1] "T" "H" "H" "H" "H" "H"

# The WHILE loop is more general than FOR loop: Any FOR loop can be written
# as a logically equivalent WHILE loop

for(i in a:b){
    # Do some work with i.
}

i <- a
while(i <= b){
    # Do some work with i
    i <- i + 1
}

# Exercise: WHILE loop for following FOR loop

for(x in v){ # Here v is a vector or list
    # Do some work with x
}

v <- 0
while(x <= v){
    v <- v + 1
}

# break and next can be used with WHILE loop
# while (TRUE) programming pattern and semmingly infinite loop

while(TRUE){
    # ... Some code ...
}

while(TRUE){
    # ... Some code ...
    if(exit){
        break
    }
    # ... Some code ...
}

# Use the while(TRUE) programming to eliminate duplicate code if we need to 
# execute some code once before checking the exit condition
# mimic the Do WHILE loop which not available in R

history <- c()

coin <- sample(c("H", "T"), 1, prob=c(0.1, 0.9)) # First coin toss.
history <- c(history, coin)
while(coin != "H"){
    coin <- sample(c("H", "T"), 1, prob=c(0.1, 0.9)) # Subsequent coin toss.
    history <- c(history, coin)
}
history

# [1] "T" "T" "T" "T" "T" "T" "T" "H"

#  We wish to execute the code once first before checking the exit condition
#  place the exit condition at the end of the WHILE loop instead of beginning

history <- c()

while(TRUE){
    coin <- sample(c("H", "T"), 1, prob=c(0.1, 0.9))
    history <- c(history, coin)
    if(coin == "H"){
        break
    }
}
history

#  [1] "T" "T" "T" "T" "T" "T" "T" "T" "T" "H"

# Exercise: R program to implement bisection root-finding method for follow 
# continuous function f

f <- function(x){
    x^3 - 3 * x^2 + 1
}

f(2)
f(4)

# [1] -3
# [1] 17


## 3.2 Exercises

# 1. The factorial of a natural number n is defined as 
# n!=n×(n???1)×(n???2)×???×1. Moreover, we define 0!=10=1. Write an R program 
# that takes a non-negative integer nn and computes its factorial n!. Do not use 
# any R's built-in function such as factorial().

n <- 5
answer <- 1
while(n > 0){
    answer <- answer * (n)
    n <- n - 1
}
answer

# [1] 120


# 2.A palindrome is a sequence of characters which reads the same forward or 
# backward. For example, the word "radar". Write an R program that takes a 
# string and checks if it is a palindrome. Do not make any copy of the sequence 
# of characters. Do not use any R's built-in function such as rev(), all(), or 
# any(). (Hint: Use strsplit(s, "")[[1]] to split a string into a vector of 
# characters.)

s <- "radar"

string <- strsplit(s, "")[[1]] # "r" "a" "d" "a" "r"
n <- length(string) # 5
i <- 1

while(i <= n){
    if(string[i] == string[n]){
        answer <- TRUE
    } else {
        answer <- FALSE
        break
    }
    i <- i + 1
    n <- n - 1
}
answer

# [1] TRUE


# 3. A prime number is a natural number greater than 1 that is not disivible by 
# other numbers except for 1 and itself. Write an R program that takes a natural
# number n and checks if it is a prime number. (Hint: Check if n is divisible
# by any of 2,.,n???12,.,n???1. Actually, is it necessary to check all of them?)

n <- 1249
num <- n - 1
while(num > 1){
    if((n %% num == 0) && (n / num > 1)) {
        answer <- FALSE
        break
    }
    answer <- TRUE
    num <- num - 1
}
answer

# [1] TRUE


# 4.Write an R program that takes two (compatible) matrices AA and BB and 
# performs matrix multiplication. Do not use any R's built-in function such as 
# sum() or %*%. Recall that
# (AB)ij=???k=1nAikBkj
# where nn is the number of columns (and rows) of A (and B).

A <- matrix(1:8, 2, 4)
B <- matrix(1:12, 4, 3) 
r <- length(A[,1]) # 2
c <-length(B[1,]) # 3
i <- 1
AB <- matrix(0, 2, 3)

while (i <= r){
    store <- 0
    for(j in 1:c ){
        for(k in 1:length(A[1,])){
            store <- store + (A[i,k] * B[k,j])
        }
        AB[i, j] <- store
        store <- 0
    }
    i <- i + 1
}
AB

#      [,1] [,2] [,3]
# [1,]   50  114  178
# [2,]   60  140  220


# 5. One (very inefficient) way to approximate the value of pi is to use the 
# Leibniz formula:
# pi = 4 × (1 - 1/3 + 1/5 - 1/7 + 1/9 -...)
# Write an R program to approximate pi using the first n terms of the Leibniz 
# formula. Store the successive approximations approx and visualize them. How 
# large must n be for the first few digits to be 3.14159?

n <- 1000
d <- 1
sign <- 1
result <- 1
i = 1
while(i <= n) {
    sign <- (-sign)
    d <- abs(d)
    d <- (d + 2) * (sign)
    result <- result + 1/d
    i <- i + 1
}
approx <- result*4

plot(approx, type="l", col="blue")
abline(h=pi, lty=2)
tail(approx, 1)


# 7. Write an R program that takes a vector x and checks if x has any duplicate 
# element. (Hint: Use more break. The loop pattern in Lecture 2 Homework 
# Question 1 might be useful.)

## Using a FOR loop
x <- c(3, -7, 6, 3, 1, -17)

answer <- FALSE

for (i in 1:6){
    for (j in 1:6){
        if(x[i] == x[j] && j > i){
            # print(c(x[i], x[j], "TRUE"))
            answer <- TRUE
        } 
    }
}
answer

# [1] TRUE

## Using a WHILE loop

x <- c(3, -7, 6, 93, 1, -7)
n <- length(x)
i <- 1
answer <- FALSE

while(i <= n){
    for(j in 1:n){
        if(x[i] == x[j] && j > i){
            print(c(x[i], x[j], i))
            answer <- TRUE
            break
        }
    }
    i <- i + 1
}
answer

# 8. Write an R program to mimic the built-in R function unique()
# which returns the set of distinct elements for a vector x.

x <- c(3, -7, 6, 3, 1, -7)
answer <- numeric()
i <- 1

while(i <= length(x)){
    for(i in 1:length(x)){
        if(!(x[i] %in% answer)){
            answer <- c(answer, x[i])
        }
    }
    i <- i + 1
}

answer













