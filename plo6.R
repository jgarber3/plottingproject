library(lattice)
library(dplyr)

setwd("/Users/jgarber/month2week4/")

## This first line will likely take a few seconds. Be patient!
dustReadings <- readRDS("summarySCC_PM25.rds")
sourceNames <- readRDS("Source_Classification_Code.rds")

#Subset only the data from Baltimore City and LA, remove outliers over 1000
dustReadings <- subset(dustReadings, (dustReadings$fips %in% c("24510","06037")) & dustReadings$Emissions < 1000)
dustReadings$fips <- as.factor(dustReadings$fips)
levels(dustReadings$fips) <- c("LA","BMORE")
dustReadings$year <- as.factor(dustReadings$year)

bwplot(dustReadings$year~dustReadings$Emissions|dustReadings$fips, layout=c(1,2), xlab="PM25 Emissions", ylab="Year")

dev.copy(png,"plot6.png")
dev.off()



