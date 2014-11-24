#Get data
setwd("C:/Users/ARORAMA6/Desktop/Coursera/04 Exploratory Data Analysis/03 Week 3/Course Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

##Subset data and append two years in one data frame
MD <- subset(NEI, fips=='24510')

# Produce graph
png(filename='plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()
