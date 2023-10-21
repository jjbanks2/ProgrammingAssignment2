# A pair of functions to generate a special "matrix"
# object and object functions that will cache the inverse
# of a matrix, and return the value from cache if available,
# or calculate the inverse if not found in cache.  Code is based on
# makeVector() and cachemean() from rdpeng/ProgrammingAssignment2.

# Creates a special "matrix" object that includes a list
# of setter and getter functions for the value of the matrix
# and its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() {
        x
    }
    setinverse <- function(solve) {
        inv <<- solve
    }
    getinverse <- function() {
        inv
    }
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


# Takes a makeCacheMatrix object as input, and calculates the matrix
# inverse, or returns it from cache if previously stored 

cacheSolve <- function(x, ...) {
    
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return (inv)
    }
    d <- x$get()
    inv <- solve(d)
    x$setinverse(inv)
    inv
}
