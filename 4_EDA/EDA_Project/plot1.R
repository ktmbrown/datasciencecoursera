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

# plot 1
png(filename = "plot1.png",width = 480,height = 480)
myTicks = c(0,8000000)
tapply(NEI$Emissions, NEI$year, FUN = sum) %>% barplot(col = seacols[c(3,4,6,7)], 
            main = "Total PM2.5 Emissions", xlab = "Year", 
            ylab = "Emissions (in tons)",ylim=range(myTicks))
dev.off()


