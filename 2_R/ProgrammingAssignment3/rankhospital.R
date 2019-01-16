# This function takes 3 arguments: 2 letter state and name of outcome and
# a ranking then returns a character vector with the name of the hospital that 
# has that ranking in that state

rankhospital <- function( state, outcome, num ) {
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", 
                       na.strings = "Not Available", 
                       stringsAsFactors = FALSE)
      mortality_names <- c("heart.attack","heart.failure","pneumonia")
      names(data)[c(11,17,23)] = mortality_names
      outcome <- gsub(" ", ".",outcome)
      
      ## Check that state and outcome are valid
      if(!(state %in% data$State)) {
            stop("invalid state")
      }
      if(!(outcome %in% mortality_names)) {
            stop("invalid outcome")
      }
      
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      
      df <- data[data$State==state,]
      df <- df[,c('Hospital.Name', outcome)]
      names(df)[2] <- 'Rate'
      ordered_df <- df[order(df$Rate,df$Hospital.Name),]
      r <- nrow(ordered_df)
      Rank <- 1:r
      final <- cbind(ordered_df,Rank)
      if(num == "best")
      {
            num <- 1
      }
      if(num == "worst") {
            maxInd <- which.max(final[,'Rate'])
            num <- final[maxInd,'Rank']
      }
      if(num > r) {
            return(NA)
      }
      rankedhosp<-final[final$Rank == num, 1]
      rankedhosp
}