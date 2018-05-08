# Exploratory Data Analysis - Assignment 2 - Q. #3

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland == fips
NEI_Maryland <- subset(NEI, fips == 24510)
NEI_Maryland$year <- factor(NEI_Maryland$year, levels=c('1999', '2002', '2005', '2008'))

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Generate the graph in the same directory as the source code
png(filename='plot3.png', width=800, height=500, units='px')

g<-ggplot(aes(x = year, y = Emissions, fill=type), data=NEI_Maryland)
g+geom_bar(stat="identity")+
  facet_grid(.~type)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
  guides(fill=FALSE)
dev.off()