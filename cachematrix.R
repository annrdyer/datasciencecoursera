## The makeCacheMatrix and cacheSolve functions enable caching and retrieval of a square invertible matrix and its inverse.


## The makeCacheMatrix caches a square invertible matrix and its inverse.
## Specifically makeCacheMatrix:
##  - sets and gets the values of a matrix
##  - sets and gets the values of the inverted matrix
makeCacheMatrix <- function(x = matrix()) {
    
    inv <- NULL
    
    ## cache the matrix
    set <- function(y) {
       x <<- y
       cinv <<- NULL
    }    
    
    ## get the cached matrix
    get <- function() {x}
    
    ## cache the inverted matrix
    setInverse <- function(solve) {inv <<- solve} 
    
    ## get the cached inverted matrix
    getInverse <- function() {inv}
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## The cacheSolve function returns the inverse of a square invertible matrix.
## If the inverse has been cached, cacheSolve returns the cached matrix.
## Else cacheSolve computes the inverse of the matrix.
cacheSolve <- function(x, ...) {
  
    ## get cached inverted matrix
    inv <- x$getInverse()
    
    ## if inverted maxtrix is not null return inverted matrix
    if(!is.null(inv)) {
       message("getting cached data")
       return(inv)
    }
    
    ## inverse not cached - get cached matrix and compute inverse
    data <- x$get()
    inv <- solve(data, ...)
    
    ## cache inverted matrix
    x$setInverse(inv)
    
    inv  
}
