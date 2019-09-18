## A pair of functions that cashe the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
    
}


## Computes the ivnerse of the special "matrix" returned by makeCacheMatrix
## If inverse already calculated (and matrix has not changed), then the
## cacheSolve should retrive the invrse from the cache
## uses the solve() function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

### Please give input in following way while running this programme.
## mat<-matrix(data= c(2,3,4,1,8,9,2,1,6), nrow=3, ncol=3)
# mat2<-makeCacheMatrix(mat)
# cacheSolve(mat2)
# cacheSolve(mat2) #for retrieving cached matrix
