## Random Sampling
The sample function draws randomly from a specified set of (scalar) objects allowing you to sample from arbitrary distributions.

```
> set.seed(1)
> sample(1:10, 4)
[1] 9 4 7 1
> sample(1:10,  4)
[1] 2 7 3 6
> sample(letters, 5)
[1] "r" "s" "a" "u" "w"
> sample(1:10) ## permutation
 [1] 10  6  9  2  1  5  8  4  3  7
> sample(1:10)
 [1]  5 10  2  8  6  1  4  3  9  7
> sample(1:10, replace = TRUE) ## Sample w/replacement
 [1]  3  6 10 10  6  4  4 10  9  7
```

## Summary
* Drawing samples from specific probability distributions can be done with r* functions
* Standard distributions are built in: Normal, Posson, Binomial, Exponential, Gamma,  etc.
* The sample function can be used to draw random samples from arbitrary vectors
* Setting the random number generator seed via set.seed is critical for reproducibility
