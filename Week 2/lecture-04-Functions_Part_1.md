# Functions (part 1)

Functions are created using the function() directive and are stord as R objects just like anything else. In particular, they are R objects of class "function".

```
f <- function(<arugments>) {
        ## Do something interesting
}
```

Functions in R are "first class objects", which means that they can be treated much like any other R object. Importantly,
* Functions can be passed as arguments to other functions
* Functions can be nested, so that you can define a function inside of another function. The return value of a function is the last expression in the function body to be evaluated.

## Function Arguments
Functions have named arguments which potentially have default values.
* The formal arguments are the arguments included in the function definition
* The formals function returns a list of all the formal arguments of a function
* Not every function call in R makes use of all the formal arguments
* Function arguments can be missing or might have default values

## Argument Matching
R functions arguments can be matched positionally or by name. So the following calls to sd are all equivalent

```
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(ma.rm = FALSE, mydata)
```
Even though it's legal, I don't recommend messing around with the order of the arguments too much, since it can lead to some confusion.

You can mix positional matching with matching by name. When an argument is matched by name, it is "taken out" of the argument list and the remaining unnamed arguments are matched in the order that they are listed in the function definition.

```
args(lm)
function(formula, data, subset, weights, na.action,
         method = "qr", model = TRUE, x = FALSE,
         y = FALSE, qr = TRUE, singular.ok = TRUE,
         contrasts = NULL, offset, ...)
```

The following two calls are equivalent.
```
lm(data = mydata, y - x, model = FALSE, 1:100)
lm(y - x, mydata, 1:100, model = FALSE)
```

* Most of the time, named arguments are useful on the command line when you have a long arugment list and you want to use the defaults for everything except for an argument near the end of the list
* Named arguments also help if you can remember the name of the argument and not its position on the argument list (plotting is a good example)


Function arugments can also be partially matched, which is useful for interactive work. The order of operations when given an argument is
1. Check for exact match for a named argument
2. Check for a partial match
3. Check fo a positional match


