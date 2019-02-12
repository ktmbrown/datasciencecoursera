#------------------------- Getting and Cleaning Data --------------------------#
# Getting data from website
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if(!file.exists("./data")) { 
      dir.creat("./data")
}

if(!file.exists("./data/household.zip")) {
      download.file(url, destfile = './data/household.zip',mode='wb' )
}
if(!file.exists("./data/household_power_consumption.txt")) {
      unzip('./data/household.zip',exdir = './data')
}

# read in first 70k lines 
data <- read.table('data/household_power_consumption.txt',sep=';',
                   nrows= 70000,na.strings = '?',header=TRUE)

# creating time column
data$Time <- paste(data$Date,data$Time)

# converting dates and times to Date objects
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(data$Time,format = '%d/%m/%Y %H:%M:%S')

# subsetting data for our dates
data <- data[(data$Date> "2007-01-31" & data$Date < "2007-02-03"),]

#------------------------------------------------------------------------------#

# plot 2
png(filename = "plot2.png",width = 480,height = 480)

plot(data$Time, data$Global_active_power,type='l',
     ylab = 'Global Active Power (kilowatts)',xlab="", main=NULL)

dev.off()