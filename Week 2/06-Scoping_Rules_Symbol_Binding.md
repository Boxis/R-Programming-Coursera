# Scoping Rules - Symbol Binding

## A Diversion on Binding Values to Symbol
How does R know which value to assign to which symbol? When I type
```
> lm <- function(x) {x * x}
> lm
function(x) {x * x}
```

how does R know what value to assign to the symbol lm? Why doesn't it give it the value of lm that is in the stats package?

When R tries to bind a value to a symbol, it searches through a series of environments to find the appropriate value. WHen you are working on the command line and need to retrieve the value of an R object, the order is roughly

1. Search the global environment for a symbol name matching the one requested.
2. Search the namespaces of each of the packages on the search list.

The search list can be found by using the search function.
```
> search()
[1] ".GlobalEnv"        "tools:rstudio"     "package:stats"     
[4] "package:graphics"  "package:grDevices" "package:utils"     
[7] "package:datasets"  "package:methods"   "Autoloads"         "package:base"    
```

## Binding Values to Symbol
* The global environment or the user's workspace is always the first element of the search list and the base package is always the last.
* The order of the packages on the search list matters!
* User's can configure which package get loaded on startup so you cannot assume that there will be a set list of packages available.
* When a user loads a package with library the namespace of that package gets put in position 2 of the search list (by default) and everything else gets shifted down the list.
* Note that R has seperate namespaces for functions and non-functions so it's possible to have an object named c and a function named c.

## Scoping Rules
The scoping rules for R are the main feature that make it different from the original S language.
* The scoping rules determine how a value is associated with a free variable in a function
* R uses lexical scoping or static scoping. A common alternative is dynamic scoping. 
* Related to the scoping rules is how R uses the search list to bind a value to a symbol
* Lexical scoping turns out to be particularly useful for simplifying statistical computations

Consider the following function.
```
f <- function(x, y){
        x^2 + y / z
}
```
This funciton has 2 formal arguments x and y. In the body of the function there is another symbol z. In this case z is called a free variable. The scoping rules of a language determine how values are assigned to free variables. Free variables are not formal arguments and are not local variables (assigned inside the funciton body).

## Lexical Scopying
Lexcial scoping in R means that

*the values of free variables are earched for in the environment in which the function was defined.*

What is an environment?
* An environment is a collection of (symbol, value) pairs, i.e. x is a symbol and 3.14 might be its value
* Every environment has a parent; it is possible for an environment to have multiple "childern"
* the only environment without a parent is the empty environment
* A function + an environment = a closure or function closure

Searching for the value for a free variable:
* If the value of a symbol is not found in the environment in which a function was defined, then the search is continued in the parent environment.
* The search continues down the sequence of parent environments until we hit the top-level environment; this usually the global environment (workspace) or the namespace of a package.
* After the top-level environment, the search continues down the search list until we hit the empty environment. If a value for a given symbol cannot be found once the empty environment is arrived at, then an error is thrown.












