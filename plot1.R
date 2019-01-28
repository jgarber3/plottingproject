library(dplyr)
library(ggplot2)

setwd("/Users/jgarber/month2week4/")

## This first line will likely take a few seconds. Be patient!
dustReadings <- readRDS("summarySCC_PM25.rds")
sourceNames <- readRDS("Source_Classification_Code.rds")

byYear = tapply(dustReadings$Emissions,dustReadings$year,sum)

plot(x=names(byYear), y=byYear/1000000, ylab="Total PM25 in Millions", xlab="Year", type="l")

dev.copy(png,"plot1.png")
dev.off()
