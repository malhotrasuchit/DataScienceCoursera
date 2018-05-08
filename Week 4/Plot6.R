# Exploratory Data Analysis - Assignment 2 - Q. #6
# Ron Mashrouteh May 23, 2014

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland
# Los Angeles County, California
NEI_Maryland.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
NEI_California.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregate
NEI_Maryland.DF <- aggregate(NEI_Maryland.onroad[, 'Emissions'], by=list(NEI_Maryland.onroad$year), sum)
colnames(NEI_Maryland.DF) <- c('year', 'Emissions')
NEI_Maryland.DF$City <- paste(rep('Baltimore City', 4))

NEI_California.DF <- aggregate(NEI_California.onroad[, 'Emissions'], by=list(NEI_California.onroad$year), sum)
colnames(NEI_California.DF) <- c('year', 'Emissions')
NEI_California.DF$City <- paste(rep('Los Angeles County', 4))

DF <- as.data.frame(rbind(NEI_Maryland.DF, NEI_California.DF))

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

# Generate the graph in the same directory as the source code
png('plot6.png')

ggplot(data=DF, aes(x=year, y=Emissions, fill=City)) + geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~City) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()