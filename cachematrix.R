## The functions makeCacheMatrix and cacheSolve can be used in conjunction to calculate the inverse 
## of an invertible matrix. Since matrix inversion is a costly operation these functions 
## facilitate the retrieval of the Inverse matrix from the cache directly without recalculating
## if the value is already available in the cache 
## Usage Example : 
## > y <- matrix(1:4,2,2)
## > v <- makeCacheMatrix(y)
## > cacheSolve(v)

## The makeCacheMatrix is a function that takes in a matrix as an argument and returns
## a list of functions for the matrix. Below given are the functions
## get() : return the matrix that is stored
## set(x) : set another matrix in the makeCacheMatrix space
## getMatrixInverse() : retrieves the inverse of the Matrix x
## setMatrixInverse(matInv) : sets the Matrix Inverse as the matrix passed i.e. matInv
makeCacheMatrix <- function(x = matrix()) {
  mI <- NULL
  set <- function(y) {
    x <<- y
    mI <<- NULL    
  }
  get <- function() x
  setMatrixInverse <- function(matInv) {
    mI <<- matInv
  }
  getMatrixInverse <- function() mI
  list(set= set,get = get,getMatrixInverse = getMatrixInverse,setMatrixInverse = setMatrixInverse)

}


## The cacheSolve function takes in the special vector created makeCacheMatrix function
## and returns the matrix inverse from the cache if available else calculates and returns the
## matrix inverse. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mI <- x$getMatrixInverse()
  if(!is.null(mI)) 
{
  message("Returned from cache")
  return(mI)
}
y <- x$get()
mI <- solve(y,...) 
x$setMatrixInverse(mI)
mI
}
