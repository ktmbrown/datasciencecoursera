rankall <- function(outcome, num = "best") {
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", 
                       na.strings = "Not Available", 
                       stringsAsFactors = FALSE)[ ,c(1, 2,7,11,17,23)]
      names(data) <- c('Provider.Number','Hospital.Name','State','heart.attack',
                       'heart.failure','pneumonia')
      
      outcome <- gsub(" ", ".",outcome)
      
      if(!(outcome %in% names(data)[4:6])) {
            stop("invalid outcome")
      }
      
      ## 
      
}