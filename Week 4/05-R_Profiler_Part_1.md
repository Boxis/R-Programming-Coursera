# Profiling R Code
## Why is My Code So Slow?
* Profiling is a systematic way to examine how much time is spend in different parts of a program
* Useful when trying to optimize your code
* Often code runs fine once, but what if you have to put it in a loop for 1,000 iterations? Is it still fast enough?
* Profiling is better than guessing?

## On Optimizing Your Code
* Getting biggest impact on speeding up code depends on knowing where the code spends most of its time
* This cannot be done without performance analysis or profiling
```
We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil
--Donald Knuth
```

* Design first, then optimize
* Remember: Premature optimization is the root of all evil
* Measure (collect data), don't guess.
* If you're going to be a scientist, you need to apply the same principles here!

## Using system.time()
* Takes an arbitrary R expression as input (can be wrapped in curly braces) and returns the amount of time taken to evaluate the expression
* Computes the time (in seconds) needed to execute an expression
  * If there's an error, gives time until error occurred
* Returns an object of class proc_time
  * **user time**: time charged to CPU(s) for this expression
  * **elapsed time**: "wall clock" time
* Usually, the user timea nd elapsed time are relatively close, for straight computing tasks
* Elapsed time may be greater than user time if the CPU spends a lot of time waiting around
* Elapsed time may be smaller than user time if your machine has multiple cores/processors (and is capable of using them)
  * Multi-threated BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
  * Parallel processing via the **parallel** package

## Example
```
## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
   user  system elapsed 
   0.12    0.10    1.51 
   
## Elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}
> x <- hilbert(1000)
> system.time(svd(x))
   user  system elapsed 
  1.605    0.00   0.742
```

## Timing Longer Expressions

```
system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})
##   user  system elapsed 
##   0.07    0.00    0.06 
```

## Beyond system.time()
* Using system.time() allows you to test certain functions or code blocks to see if they are taking excessive amounts of time
* Assumes you already know where the problem is and you can call system.time() on it
* What if you don't know where to start?









