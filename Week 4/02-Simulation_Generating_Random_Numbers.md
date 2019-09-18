# Generating Random Numbers
Functions for probability distributions in R
* rnorm: generate random Normal variables with a given mean and standard deviation
* dnrom: evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
* pnorm: evaluate the cumulative distribution function for a Normal distribution
* rpois: generate random Poisson variates with a given rate

Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
* d for density
* r for random number generation
* p for cumulative distribution
* q for quantile function

Working with the Normal distributions requires these four functions

```
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)
```

If phi is the cumulative distribution function for a standard Normal distribution, then pnorm(q) = phi(q) and qnorm = (phi^-1) * p

```
> x <- rnorm(10)
 [1]  2.29259281 -1.35362392 -0.79638613 -0.17734192  0.91994311 -0.78302057  1.26933484 -0.03056104  2.71053908
[10] -0.30866493
> x <- rnorm(10, 20, 2)
> x
 [1] 21.43283 18.16126 18.97311 17.57482 19.32980 19.16607 15.91908 18.89663 21.40507 19.54693
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  15.92   18.35   19.07   19.04   19.49   21.43 
```

Setting the random number seed with set.seed ensures reproducibility
```
> set.seed(1)
> rnorm(5)
[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
> rnorm(5)
[1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
> set.seed(1)
> rnorm(5)
[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
```
Always set the random number seed when conducting a simulation!

Generating Poisson data
```
> rpois(10, 1)
 [1] 0 0 1 1 2 1 1 4 1 2
> rpois(10, 2)
 [1] 4 1 2 0 1 1 0 1 4 1
> rpois(10, 20)
 [1] 19 19 24 23 22 24 23 20 11 22
 
> ppois(2, 2)   ## Cumulative distribution
[1] 0.6766764   ## Pr(x <= 2)
> ppois(4, 2)
[1] 0.947347    ## Pr(x <= 4)
> ppois(6, 2)
[1] 0.9954662   ## Pr(x <= 6)
```




