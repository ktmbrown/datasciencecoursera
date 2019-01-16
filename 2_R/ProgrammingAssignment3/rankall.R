# This function takes 2 arguments: name of outcome and a hosptial ranking and
# returns a 2-column data frame containing the hospital in each state
# that has a ranking specified in num

## Read outcome data
rankall <- function( outcome, num = "best" ) {
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", 
                       na.strings = "Not Available", 
                       stringsAsFactors = FALSE)
      mortality_names <- c("heart.attack","heart.failure","pneumonia")
      names(data)[c(11,17,23)] = mortality_names
      outcome <- gsub(" ", ".",outcome)
      
      
      ## Check outcome and num
      if(!(outcome %in% mortality_names)) {
            stop("invalid outcome")
      }
      
      
      ## For each state, find the hospital of the given rank
      
      
      
      if( num == "best" ) {
            num = 1
      }
      if( num == "worst" ) {
            
      }
      
      ## Return a data frame with the hospital names and the (abbreviated)
      ## state name
      for(s in data$unique(data$State)) {
            df <- data[data$State==s,]
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
            result <- c(result,rankedhosp)
      }
      
      #df <- data[order(data$State,data[[outcome]]),]
      #result <- data.frame("hospital" = df$Hospital.Name, "state" = df$State)
      #result
      
      #df <- data.frame("hospital" = x, "state" = names(x))
      #df <- df[order(df_x$state),]
      #df
      
}