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

# plot 2
png(filename = "plot2.png",width = 480,height = 480)
myTicks = c(0,3500)
tapply(NEI[NEI$fips=="24510",]$Emissions, NEI[NEI$fips=="24510",]$year, FUN = sum) %>% 
      barplot(col = seacols[c(3,4,6,7)], main = "Total PM2.5 Emissions in Baltimore City", 
              xlab = "Year", ylab = "Emissions",ylim=range(myTicks))

dev.off()