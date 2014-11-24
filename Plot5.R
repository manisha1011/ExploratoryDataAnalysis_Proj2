library(ggplot2)

#Get data
setwd("C:/Users/ARORAMA6/Desktop/Coursera/04 Exploratory Data Analysis/03 Week 3/Course Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# Produce graph
png('plot5.png')

qplot(year,total
      ,data=MD.df
      ,geom=c("point","smooth")
      ,ylab="PM2.5"
      ,main="Motor Verhicle Emissions for Baltimore City"
)

dev.off()
