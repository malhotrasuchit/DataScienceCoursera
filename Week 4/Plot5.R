# Exploratory Data Analysis - Assignment 2 - Q. #5

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
NEI_Maryland.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
NEI_Maryland.df <- aggregate(NEI_Maryland.onroad[, 'Emissions'], by=list(NEI_Maryland.onroad$year), sum)
colnames(NEI_Maryland.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Generate the graph in the same directory as the source code
png('plot5.png')

g<-ggplot(aes(year, Emissions/10^5), data=NEI_Maryland.df)
g+geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()