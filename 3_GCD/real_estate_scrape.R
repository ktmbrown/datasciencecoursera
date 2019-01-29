# General-purpose data wrangling
library(tidyverse)  

# Parsing of HTML/XML files  
library(rvest)    

# String manipulation
library(stringr)   

# Verbose regular expressions
library(rebus)     

# Eases DateTime manipulation
library(lubridate)

get_last_page <- function(html) {
      pages_data <- html %>% 
      
            # The '.' indicates the class
            html_nodes('.pages-item') %>% 
           
            # Extract the raw text as a list
            html_text() 
      
      # The second to last of the buttons is the one
      pages_data[length(pages_data)] %>%            
            
            # Take the raw string
            unname() %>%                                     
     
            # Convert to number
            as.numeric()  
}

home <-str_c('https://www.remax.com/realestatehomesforsale/sanantonio-tx-p00',1,'.html')
first_page <- read_html(home)
latest_page_number <- get_last_page(first_page)
list_of_pages <- str_c('https://www.remax.com/realestatehomesforsale/sanantonio-tx-p00',1:latest_page_number,'.html')

get_addresses <- function(html) {
      a
}