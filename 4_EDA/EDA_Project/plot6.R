library(dplyr)
library(RColorBrewer)
library(ggplot2)

## creating color palette
seacols <- brewer.pal(8, "YlGnBu")

## adjusting scientific notation option
options(scipen=999)

## Reading in the data
NEI <- readRDS("Untracked/summarySCC_PM25.rds")
SCC <- readRDS("Untracked/Source_Classification_Code.rds")

## Changing year & type to Factor variables
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

# finding appropriate codes in SCC
motor_codes <- grep('Vehicles',levels(SCC$EI.Sector),value=TRUE)
motor_ind <- which(SCC$EI.Sector == motor_codes[1] | SCC$EI.Sector == motor_codes[2] | 
                         SCC$EI.Sector == motor_codes[3] | SCC$EI.Sector == motor_codes[4])
scc_codes <- SCC[motor_ind,1]

## finding rows in NEI based on SCCs
motor_df <- NEI[NEI$SCC %in% scc_codes,]

# plot 6
png(filename = "plot6.png",width = 600,height = 500)
myTicks = c(0,5000)
par(mfrow = c(1, 2),margin=c(5, 5, 1, 1)+.1)
tapply(motor_df[motor_df$fips=="24510",]$Emissions, motor_df[motor_df$fips=="24510",]$year, FUN = sum) %>% 
      barplot(col = seacols[c(3,4,6,7)], 
              main = "PM2.5 Emissions\nfrom motor vehicles\nin Baltimore City", 
              xlab = "Year", 
              ylab = "Emissions (in tons)",ylim=range(myTicks))
tapply(motor_df[motor_df$fips=="06037",]$Emissions, motor_df[motor_df$fips=="06037",]$year, FUN = sum) %>% 
      barplot(col = seacols[c(3,4,6,7)], 
              main = "PM2.5 Emissions\nfrom motor vehicles\nin LA County", 
              xlab = "Year", 
              ylab = "Emissions (in tons)",ylim=range(myTicks))
dev.off()