library(dplyr)
library(ggplot2)

setwd("/Users/jgarber/month2week4/")

## This first line will likely take a few seconds. Be patient!
dustReadings <- readRDS("summarySCC_PM25.rds")
sourceNames <- readRDS("Source_Classification_Code.rds")

#Subset only the data from Baltimore City and remove the outlier
#There is a reading from 1999 that was over 1,000 and it skews the results if you leave it in. I
#removed it by selecting only values under 500 
dustReadings <- subset(dustReadings, dustReadings$fips == "24510" & dustReadings$Emissions < 500)
byYear = tapply(dustReadings$Emissions,dustReadings$year,sum)

plot(x=names(byYear), y=byYear, ylab="Total PM25", xlab="Year", type="l", main="Baltimore City")

dev.copy(png,"plot2.png")
dev.off()
