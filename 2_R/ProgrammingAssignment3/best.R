# This function takes 2 arguments: 2 letter state and name of outcome and
# returns a character vector with the name of the hospital that has the lowest
# 30-mortality for the specified outcome in that state

best <- function( state, outcome ) {
      ## Read outcome data
      
      data <- read.csv("outcome-of-care-measures.csv", 
                       na.strings = "Not Available", 
                       stringsAsFactors = FALSE)
      names(data)[c(11,17,23)] = c("heart.attack","heart.failure","pneumonia")
      
      outcome <- gsub(" ", ".",outcome)
      
      ## Check that state and outcome are valid
      if(!(state %in% data$State)) {
            stop("invalid state")
      }
      
      if(!(outcome %in% c("heart.attack","heart.failure","pneumonia"))) {
            stop("invalid outcome")
      }
      
      ## Return hospital name in that state with lowest 30-day death rate
      df <- data[data$State==state,]
      minIndex <- which.min(df[,outcome])
      best <- df[minIndex,2]
      best
}