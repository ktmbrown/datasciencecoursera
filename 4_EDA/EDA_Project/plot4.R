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

## finding appropriate codes in SCC
coal_codes <- grep('Coal',levels(SCC$EI.Sector),value=TRUE)
coal_ind <- which(SCC$EI.Sector == coal_codes[1] | SCC$EI.Sector == coal_codes[2] | SCC$EI.Sector == coal_codes[3])
scc_codes <- SCC[coal_ind,1]

## finding rows in NEI based on SCCs
coal_df <- NEI[NEI$SCC %in% scc_codes,]

# plot 4

png(filename = "plot4.png",width = 480,height = 480)
myTicks = c(0,300000,600000)
tapply(coal_df$Emissions, coal_df$year, FUN = sum) %>% 
      barplot(col = seacols[c(3,4,6,7)], 
              main = "Total U.S. PM2.5 Emissions\nfrom coal combustion-related sources", 
              xlab = "Year", 
              ylab = "Emissions (in tons)",ylim=range(myTicks))
dev.off()