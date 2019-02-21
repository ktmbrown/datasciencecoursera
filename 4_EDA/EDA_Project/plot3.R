library(dplyr)
library(RColorBrewer)
library(ggplot2)

## creating color palette
seacols <- brewer.pal(8, "YlGnBu")

## Reading in the data
NEI <- readRDS("Untracked/summarySCC_PM25.rds")
SCC <- readRDS("Untracked/Source_Classification_Code.rds")

## Changing year & type to Factor variables
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)


# plot 3
png(filename = "plot3.png",width = 480, height = 480, antialias = 'none')
data <-aggregate(NEI[NEI$fips=="24510",]$Emissions, 
                 by=list(NEI[NEI$fips=="24510",]$year,NEI[NEI$fips=="24510",]$type), 
                 FUN=sum, na.rm=TRUE)
Year=data$Group.1
ggplot(data, aes(fill=Year, y=data$x, x=data$Group.2))+ scale_fill_brewer(palette="YlGnBu")+ 
      geom_bar(position="dodge", stat="identity") + labs(title='Emissions in Baltimore City',
                                                         subtitle='by Type in years 1999 - 2008') +
      xlab('Type') + ylab('Emissions(in tons)')


dev.off()
