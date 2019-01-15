pollutantmean <- function(directory,pollutant,id = 1:332) {
      # setting directory
      current_dir <- getwd()
      if(!endsWith(current_dir,"specdata")) {
            setwd(paste(current_dir,directory,sep='/'))
      }
      
      # creating empty data frame to hold all data
      df <- data.frame("Date" = double(),"sulfate" = numeric(), "nitrate" = numeric(),"ID" = numeric())
      
      #iterating through id vector to extract data from multiple files
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
            df <- rbind(df,this.df)
            
            
      }
      mean(df[,pollutant],na.rm = TRUE)
}