# Your First R Function

Add two numbers together.
```
add2 <- function(x, y) {
        x + y
}
```

Take a vector and return any number above 10.
```
above10 <- function(x) {
        use <- x > 10
        x[use]
}
```

Take a vector and return a subset of numbers above n.
```
above <- function (x, n) {
        use <- x > n
        x[use]
}
```

Take a vector and return a subset of numbers above n (default n = 10).
```
above <- function (x, n = 10) {
        use <- x > n
        x[use]
}
```

Take a matrix or a dataframe and calculate the mean of each column. Include an optional argument to keep or remove NA values in the data.
```
columnmean <- function(y, removeNA = TRUE) {
        nc <- ncol(y)
        means <- numeric(nc)
        for(i in 1:nc) {
                means[i] <- mean(y[, i], na.rm = removeNA)
        }
        means
}
```

