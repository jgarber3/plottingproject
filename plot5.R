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

#Subset only the values from motor vehicles by using sources starting with "Mobile"
mobile <- subset(sourceNames, grepl("^Mobile", sourceNames$EI.Sector))
#then seubset the observations down to just those 
dustReadings <- subset(dustReadings, dustReadings$SCC %in% mobile[,1])

boxplot(Emissions~year,dustReadings, ylim=c(0,5), ylab="Emissions", xlab="Year", main="PM25 for Motor Vehicles in Baltimore City")

dev.copy(png,"plot5.png")
dev.off()



