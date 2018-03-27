## Put comments here that give an overall description of what your
## functions do

## Creates Special Matrix Object that can Cache its Inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    } 
    get <- function()  x
    
    setinverse <- function(y) {
        i <<- y
    }
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Compute Inverse of Matrix returned by makeCacheMatrix if not already calculated

cacheSolve <- function(x, ...) {
    i <- x$getinverse
    
    if (!is.null(i)){
        message("getting catched inverse")
        i
    }
    A <- x$get
    i <- ginv(A)
    x$setinverse(i)
    i
}
