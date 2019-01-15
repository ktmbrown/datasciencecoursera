complete <- function(directory, id = 1:332) {
      current_dir <- getwd()
      if(!endsWith(current_dir,directory)) {
            setwd(paste(current_dir,directory,sep='/'))
      }
      nobs <- numeric()
      
      for(i in id) {
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
            nobs <- c(nobs,sum(complete.cases(this.df)))
      }
      
      df <- data.frame('id'=id,'nobs'=nobs)
      df
}