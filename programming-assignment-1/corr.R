## 'directory' is a character vector of length 1 indicating
## the locaiton of CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!

rm(list = ls())

corr <- function(directory, threshold = 0) {
    cor_vect <- numeric()
    files <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
    
    for(value in files)
    {
        file_data <- read.csv(value)
        if(sum(complete.cases(file_data)) > threshold){
            good <- complete.cases(file_data)
            complete_data <- file_data[good,]
            cor_vect<-c(cor_vect,cor(complete_data$sulfate,
                                     complete_data$nitrate))
        }
    }
    cor_vect
}


