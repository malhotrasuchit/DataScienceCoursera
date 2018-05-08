# Exploratory Data Analysis - Assignment 2 - Q. #4

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

# Generate the graph in the same directory as the source code
png(filename='plot4.png')

g<-ggplot(aes(year, Emissions/10^5), data=merge)
g+geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()