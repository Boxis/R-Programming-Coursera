## Generating Random Numbers From a Linear Model
Suppose we want to simulate from the following linear model

```
> set.seed(20)
> x <- rnorm(100)
> e <- rnorm(100, 0, 2)
> y <- 0.5 + 2 * x + e
> summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 
> plot(x, y)
```

![Image of Linear Model](https://github.com/Boxis/R-Programming-Coursera/blob/master/Week%204/img/w4_simulation_linear_model.PNG)

What if x is binary?
```
> set.seed(10)
> x <- rbinom(100, 1, 0.5)
> e <- rnorm(100, 0, 2)
> y <- 0.5 + 2 * x + e
> summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410 
> plot(x, y)
```
![Image of binary](https://github.com/Boxis/R-Programming-Coursera/blob/master/Week%204/img/w4_simulation_linear_model_binary.PNG)

Suppose we want to simulate from a Poisson model where

Y ~ Possion(μ)

log μ = β0 +  β1x

and β0 = 0.5 and β1 = 0.3. We need to use the rpois function for this

```
> set.seed(1)
> x <- rnorm(100)
> log.mu <- 0.5 + 0.3 * x
> y <- rpois(100, exp(log.mu))
> summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    1.00    1.00    1.55    2.00    6.00 
> plot(x, y)
```
![Image of poisson](https://github.com/Boxis/R-Programming-Coursera/blob/master/Week%204/img/w4_simulation_linear_model_poisson.PNG)




