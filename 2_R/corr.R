corr <- function(directory, threshold = 0) {
      current_dir <- getwd()
      if(!endsWith(current_dir,directory)) {
            setwd(paste(current_dir,directory,sep='/'))
      }
      
      # creating a df that holds the number of completely observed
      # cases in each data file
      complete_df <- complete(directory)
      
      # make a specific list of the id's that meet the threshold
      id <- complete_df[complete_df$nobs>threshold,]$id
      
      # make an empty vector to hold correlations
      corr_vect <- numeric()
      
      # iterate through the files that meet the threshold
      for( i in id ) {
            if(i < 10) {
                  lead_0 <- paste0('00',i)
                  filename <- paste(lead_0,'csv',sep='.')
            } else if(i < 100) {
                  lead_0 <- paste0('0',i)
                  filename <- paste(lead_0,'csv',sep='.')
            } else {
                  filename <- paste(i,'csv',sep='.')
            }
            this.df <- read.csv(filename)
            
            # subset to complete cases
            good <- complete.cases(this.df)
            this.df <- this.df[good,]
            
            # calculate correlation
            correlation <- cor(this.df$sulfate,this.df$nitrate)
           
             # append to corr_vect
            corr_vect = c(corr_vect,correlation)
      }
      # return vector of correlations
      corr_vect
}