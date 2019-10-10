##  Lecture 6

# 6.1 Apply
# A whole family of built-in R functions to "apply" a function to each chunk
# of some data without actually writing a FOR loop explicitly to traverse the
# data

# Matrix, array
apply # Is R loop. Works along one dimension of matrix and array.
      # No "simplify" so not safe to use inside a function. Not idempotent.

# Vector, list
lapply # Is C loop.
    sapply # Wrappy of lappy. It guesses how to convert the output.
        replicate # Wrapper of sapply.
vapply # Re-implementation of lapply to store data or matrix directly. Faster 
       # than sapply.
rapply # Recursive version of lapply.
tapply # It is basically unlist(lapply(split(...))) for performing "split - 
       # apply-combine".
ave # Uses lapply.

# Multiple lists
mapply # Multivariate version of sapply.
    Map # Wrapper of mapply without simplifying the output.
    Vectorize # Use mapply.

# Other related functions
aggregate # Generic function. Its data.frame version uses lapply and sapply.
by # Object-oriented wrapper of tapply.

# Most commonly used: apply(), lapply(), sapply(), mapply(), and tapply()
# Use apply() on each row or each column of a matrix (or generally, on one or
# more dimensions of a multi-dimensional array).

set.seed(1) # Set the seed of the random nunmber generator for reproducibility
m <- matrix(sample(c(0,1), size=20, replace=TRUE, prob=c(0.8,0.2)),
            nrow=4, ncol=5)
m

#      [,1] [,2] [,3] [,4] [,5]
# [1,]    0    0    0    0    0
# [2,]    0    1    0    0    1
# [3,]    0    1    0    0    0
# [4,]    1    0    0    0    0

count.nonzero <- function(x){
    return(sum(x != 0))
}

apply(m, MARGIN = 1, FUN=count.nonzero) # Keep the 1st dimension
apply(m, 2, count.nonzero)

# [1] 0 2 1 1
# [1] 1 2 0 0 1

# Use lapply() on each column of a data frame (or more generally, on each item
# of a list). Recall that a data frame is stroed internally as a list of
# vectors.

basket <- data.frame(fruit=c("Apple", "Kiwi", "Orange"),
                     price=c(2.59, 0.79, NA),
                     weight=c(NA, NA, 1.2))

count.na <- function(x){
    return(sum(is.na(x)))
}

lapply(basket, count.na) # It returns a list

# $fruit
# [1] 0

# $price
# [1] 1

# $weight
# [1] 2

# use sapply() to simplify the output of lapply(). Also notice the usuage of
# one-line anonymous function here.

sapply(basket, function(x) sum(is.na(x))) # It reutrns a vector.

# fruit  price weight 
# 0      1      2 

# Use mapply() to traverse more than one sequence of data simultaneously.
basket <- data.frame(fruit=c("Apple", "Kiwi", "Orange"),
                     price=c(2.59, 0.79, 0.99),
                     weight=c(2.5, 3, 1.2))

checkout <- function(price, weight){
    if(weight >= 2){
        # Discount price
        price <- price * 0.9
    }
    return (price * weight)
}

mapply(checkout, basket$price, basket$weight)
# [1] 5.8275 2.1330 1.1880


# 6.2 Factor

# A factor is a special data type in R to respresent a categorical variable.
# Why do we need a factor?
    # 1. It encodes the levels of a categorical variable as integers for
    # efficiency
    # 2. Many statistical analyses in R understand the meaning of a factor and
    # handle it correctly. For example, in linear regression lm(), if you 
    # convert a variable to a factor, then you don't need to create dummy 0-1 
    # variables yourself, and the ANOVA anova() also groups all levels of a
    # factor together properly.
# Built-in R functions: factor(), as.factor(), levels(), nlevels(), relevel()
# gl()

blood.type <- c("O", "A", "B", "A", "O", "AB", "A", "B")
blood.type
str(blood.type)
# [1] "O"  "A"  "B"  "A"  "O"  "AB" "A"  "B" 
# chr [1:8] "O" "A" "B" "A" "O" "AB" "A" "B"

blood.type.f <- factor(blood.type) # Convert a vector to a factor.
blood.type.f
str(blood.type.f)
levels(blood.type.f)
# [1] O  A  B  A  O  AB A  B 
# Levels: A AB B O
# Factor w/ 4 levels "A","AB","B","O": 4 1 3 1 4 2 1 3
# [1] "A"  "AB" "B"  "O" 

as.numeric(blood.type.f) # Extract the integer encoding
as.character(blood.type.f) # Convert back to character string
# 1] 4 1 3 1 4 2 1 3
# [1] "O"  "A"  "B"  "A"  "O"  "AB" "A"  "B" 

# When you use read.csv() to import a CSV file into a data frame, it 
# automatically converts each column that has any non-numeric value into
# a factor. To disable this behavior, use read.csv(..., stringAsFactors=FALSE)




