rankall <- function(outcome, num = "best") {
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", 
                       na.strings = "Not Available", 
                       stringsAsFactors = FALSE)[ ,c(1, 2,7,11,17,23)]
      names(data) <- c('Provider.Number','Hospital.Name','State','heart.attack',
                       'heart.failure','pneumonia')
      
      outcome <- gsub(" ", ".",outcome)
      
      df_outcome <- data[,c(1,2,3,match(outcome,names(data)))]
      
      ## Check that outcome is valid
      if(!(outcome %in% names(data)[4:6])) {
            stop("invalid outcome")
      }
      
      ## for each state, find the hospital with the given rank
      
      # split by state, sort and add rank
      bystate <- split(df_outcome,df_outcome$State)
      df_sorted <- lapply(bystate,rank_df,outcome)
      
      # get provider numbers by rank
      hn <- sapply(df_sorted,hosp_name,num)
      
      # creating resulting df
      df_result <- data.frame(matrix(ncol = 2, nrow = 54))
      c_n <- c('hospital','state')
      r_n <- names(hn)
      colnames(df_result) <- c_n
      rownames(df_result) <- r_n
      
      # filling resulting df
      df_result$state <- r_n
      df_result$hospital <- hn
    
      # find and return Hospita.Name by rank
      hosp_name <- function(df,num) {
            print(tail(df))
            if(num == 'best') {
                  r = 1 
            } else if(num == 'worst') {
                  r = nrow(df)
            } else {
                  r = num
            }
            if(r > nrow(df))
            {
                  return('<NA>')
            }

            hn <- df[df$Rank == r,2]
      }
      
      # sort a df by outcome then name and return sorted df with rank column
      rank_df <- function(df,outcome) {
            df <- df[order(df[[outcome]], df[['Hospital.Name']]),]
            Rank <- c(1:nrow(df))
            names(Rank) <- c('Rank')
            df <- cbind(df,Rank)
            df
      }
      
      df_result
}