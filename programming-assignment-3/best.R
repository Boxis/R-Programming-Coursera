best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    outcomes = c("heart attack", "heart failure", "pneumonia")
    if(outcome %in% outcomes == FALSE) stop("invalid outcome")
        ## read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## filter and simplify the column names
        data <- data[c(2, 7, 11, 17, 23)]
        names(data)[1] <- "name"
        names(data)[2] <- "state"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(data)[5] <- "pneumonia"
        
    ## validate the state string
    states <- data[, 2]
    states <- unique(states)
        
    if(state %in% states == FALSE) stop("invalid state")
    
    ## grab only rows with our state value
    data <- data[data$state == state & data[outcome] != "Not Available", ]
    vals <- data[, outcome]
    rowNum <- which.min(vals)
    
    ## return hospital name in that stae with lowest 30-day death rate
    data[rowNum, ]$name
}

best("TX", "heart attack")

best("MD", "pneumonia")

best("BB", "heart attack")

best("NY", "heart attackd")
