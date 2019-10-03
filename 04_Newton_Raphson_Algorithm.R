## Lecture 4
# 4.1 Newton-Raphson Algorithm

# Exercise 1

x.new <- x.old - (x.old^2 - 4*x.old - 7)/(2*x.old - 4)


# Exercise 2
# FOR loop to implement the algorithm with T = 100 iterations

num.iter <- 100
x0 <- 10

x <- x0

for(t in 1:num.iter){
  x <- x - (x^2 - 4*x - 7) / (2 * x - 4)
}
root <- x

root

# [1] 5.316625


# Exercise 3
# WHILE loop to implement the algorithm with the exit condition
# |x_t+1 - x_t| < epsilon where epsilon = 1e-10

epsilon <- 1e-10
x0 <- 10

x.old <- x0
while(TRUE){
  x.new <- x.old - (x.old^2 - 4*x.old - 7)/(2*x.old - 4)
  if (abs(x.new - x.old) < epsilon) {
    break
  }
  x.old <- x.new
}

root <- x.new

root

# [1] 5.316625


# Exercise 4
# Modify the FOR loop in Ex 2 to also incorporate exit condition of 
# Ex 3

num.iter <- 100
epsilon <- 1e-10
x0 <- 10

x <- x0
for(t in 1:num.iter){
  update <- (x^2 - 4*x - 7)/(2*x - 4)
  if(abs(update) < epsilon){
    break
  }
  x <- x- update
}
root <- x
root

# [1] 5.316625


# Exercise 5
# Modify the WHILE loop in Ex 3 to also incorporate the exit condition
# of Ex 2

num.iter <- 100
epsilon <- 1e-10
x0 <- 10

t <- 0
x.old <- x0
while(TRUE){
  t <- t + 1
  x.new <- x.old - (x.old^2 - 4*x.old - 7)/(2*x.old - 4)
  if (abs(x.new) < epsilon || t == num.iter){
    break
  }
  x.old <- x.new
}
root <- x.new
root

# [1] 5.316625








