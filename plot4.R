library(dplyr)

setwd("/Users/jgarber/month2week4/")

## This first line will likely take a few seconds. Be patient!
dustReadings <- readRDS("summarySCC_PM25.rds")
sourceNames <- readRDS("Source_Classification_Code.rds")

#Find only the observations that are from coal combustion sources only
#First find all the source ids for coal combusition
coal <- subset(sourceNames, grepl("Coal", sourceNames$EI.Sector))
#then seubset the observations down to just those
dustReadings <- subset(dustReadings, dustReadings$SCC %in% coal[,1])

#Because the emmissions values are so different between types, scale Emmisions so it's centered
dustReadings$Emissions <- scale(dustReadings$Emissions)

boxplot(log10(Emissions) ~ year,dustReadings, xlab="Year", ylab="Scaled/Centered Emissions of PM25", main="PM25 from Coal Combustion")

dev.copy(png, "plot4.png")
dev.off()



