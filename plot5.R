# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Get Baltimore emissions from motor vehicle sources
Baltimore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Baltimore.emissions.aggr <- aggregate(Emissions ~ year, data=Baltimore.emissions, FUN=sum)

# plot
library(ggplot2)
png("plot5.png")
ggplot(Baltimore.emissions.aggr, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()