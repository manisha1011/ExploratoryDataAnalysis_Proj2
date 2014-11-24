#Get data
setwd("C:/Users/ARORAMA6/Desktop/Coursera/04 Exploratory Data Analysis/03 Week 3/Course Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

#Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Produce graph
png(filename='plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()
