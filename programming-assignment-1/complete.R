## 'directory' is a character vector of length 1 indicating
## the locaiton of CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1 117
## 2 1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {
    file_list <- list.files(paste(getwd(), "/", directory, "/", sep=''), pattern="*.csv")
    ids <- c()
    counts <- c()
    
    for(i in id) {
        data <- read.csv(paste(getwd(),"/", directory,"/", file_list[i], sep=''))
        ids <- c(ids, i)
        completeCases <- data[complete.cases(data),]
        counts <- c(counts, nrow(completeCases))
    }
    data.frame(id= ids, nobs = counts)
}
