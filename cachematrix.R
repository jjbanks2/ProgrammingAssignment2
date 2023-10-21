# A pair of functions to generate a special "matrix"
# object and object functions that will cache the inverse
# of a matrix, and return the value from cache if available,
# or calculate the inverse if not found in cache

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
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


# Takes a makeCacheMatrix objects input, and calculates the 
# inverse, or returns it from cache if previously stored 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
