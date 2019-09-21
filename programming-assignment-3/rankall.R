rankall <- function(outcome, num = "best") {
    ## read outcome data
    ## check that state and outcome are valid
    ## for each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbrevaited) state name
    
    ## validate the outcome string
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if(outcome %in% outcomes == FALSE) stop("invalid outcome")
    
    ## read the data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data <- data[c(2, 7, 11, 17, 23)]
    names(data)[1] <- "name"
    names(data)[2] <- "state"
    names(data)[3] <- "heart attack"
    names(data)[4] <- "heart failure"
    names(data)[5] <- "pneumonia"
    
    ## validate the num value
    if(num != "best" && num != "worst" && num%%1 != 0) stop("invalid num")
    
    data <- data[data[outcome] != "Not Available", ]
    
    ## order the data
    data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
    data <- data[order(data$name, decreasing = FALSE), ]
    data <- data[order(data[outcome], decreasing = FALSE), ]
    
    ## helpfer function to process the num argument
    getHospByRank <- function(df, s, n){
        df <- df[df$state == s, ]
        vals <- df[, outcome]
        if(n == "best"){
            rowNum <- which.min(vals)
        }
        else if(n == "worst"){
            rowNum <- which.max(vals)
        }
        else {
            rowNum <- n
        }
        df[rowNum, ]$name 
    }
  
    ## for each stae, find the hospital of the given rank
    states <- data[, 2]
    states <- unique(states)
    newdata <- data.frame("hospital" = character(), "state" = character())
    for(st in states) {
        hosp <- getHospByRank(data, st, num)
        newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
    }
    
    ## return a data frame with the hospital names and the (abbreviated) state
    ## name
    newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
    newdata
}

head(rankall("heart attack", 20) ,10)
tail(rankall("pneumonia", "worst"), 3)
