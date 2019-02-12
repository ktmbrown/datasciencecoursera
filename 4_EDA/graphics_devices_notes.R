library(datasets)


with(faithful,plot(eruptions,waiting))
title(main='Old Faithful Geyser Data')
dev.copy(png,'geyserplot.png')
dev.off()
