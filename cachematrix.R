# A pair of functions to generate a special "matrix"
# object and object functions that will cache the inverse
# of a matrix, and return the value from cache if available,
# or calculate the inverse if not found in cache.  Code is based on
# makeVector() and cachemean() from rdpeng/ProgrammingAssignment2.


# Creates a special "matrix" object with setter and getter
# object functions for the value of the matrix and its inverse, and
# returns a list of the object functions
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
    list(set = set, get = get, setinverse = setinverse, 
         getinverse = getinverse)
}


# Takes a makeCacheMatrix object as input, and calculates the matrix
# inverse, or returns it from cache if previously stored 
cacheSolve <- function(x, ...) {
    
    # checks if inverse is in cache
    inv <- x$getinverse()

    # if inverse is in cache, return the value 
    if(!is.null(inv)) {
        return (inv)
    }
    
    # if inverse is not in cache, retrieve the matrix
    d <- x$get()

    # calculate inverse    
    inv <- solve(d)
    
    # add inverse to cache
    x$setinverse(inv)

    # return calculated inverse
    inv
}
