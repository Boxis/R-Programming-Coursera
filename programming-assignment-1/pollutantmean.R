## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "suflate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!

rm(list = ls()) # clear global environment

pollutantmean <- function(directory, pollutant, id = 1:332) {
    file_list <- list.files(path=paste(getwd(),"/",directory,"/", sep=''), pattern="*.csv")
    means <- c()
    for(i in id){
        data <- read.csv(paste(getwd(),'/',directory,'/', file_list[i], sep=''))
        d <- data[,pollutant]
        d <- d[!is.na(d)]
        means <- c(means, d)
      }
    mean(means)
}
