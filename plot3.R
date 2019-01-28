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

grouped <- dustReadings %>% group_by(type,year) %>% summarise(sum(Emissions))
grouped$type <- as.factor(grouped$type)

ggplot(grouped, aes(grouped$year)) +
    geom_line(aes(y=grouped$`sum(Emissions)`, colour=grouped$type)) +
    xlab("Year") + ylab("Total Emmisions") 
   
ggsave("plot3.png")

