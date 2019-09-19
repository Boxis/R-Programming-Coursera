# The R Profiler
* The Rprof() function starts the profiler in R
  * R must be compiled with profiler support (but this is usually the case)
* The summaryRprof() function summarizes the output from Rprof() (otherwise it's not readable)
* DO NOT use system.time() and Rprof() togehter or you will be sad
* Rprof() keeps track of the function call stack at regularly sampled intervals and tabulates how much time is spend in each function
* Default sampling interval is 0.02 seconds
* NOTE: if your code runs very quickly, the profiler is not useful, but then you probably don't need it in that case

## Using summaryRprof()
* The summaryRprof() function tabulates the R profiler output and calculates how much time is spend in which function
* There are two methods for normalizing the data
* "by.total" divides the time spend in each function by the total run time
* "by.self" does the same but first subtracts out the time spent in functions above the call stack

## By Total
![Image of By Total](https://github.com/Boxis/R-Programming-Coursera/blob/master/Week%204/img/w4_r_profiler_bytotal.PNG)

## By Self

![Image of By Self](https://github.com/Boxis/R-Programming-Coursera/blob/master/Week%204/img/w4_r_profiler_byself.PNG)

## summaryRprof() Output
```
$sample.interval
[1] 0.02

$sampling.time
[1] 7.41
```

## Summary
* Rprof() runs the profiler for performance of analysis of R code
* summaryRprof() summarizes the output of Rprof() and gives percent of time spent in each function (with two types of normalization)
* Good to break your code into functions so that the profiler can give useful information about where time is being spent
* C or Fortran code is not profiled


