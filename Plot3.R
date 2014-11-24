require(ggplot2)

#Get data
setwd("C:/Users/ARORAMA6/Desktop/Coursera/04 Exploratory Data Analysis/03 Week 3/Course Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

##Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

# Produce graph
png(filename='plot3.png', width=800, height=500, units='px')

ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
        geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
        ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
        ggtitle('Emissions per Type in Baltimore City, Maryland') +
        geom_jitter(alpha=0.10)

dev.off()

