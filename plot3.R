# load the libraries
library(plyr)
library(ggplot2)

# Read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Make a subset of Baltimore City
BaltimoreCity <- subset(NEI, fips == "24510")

# Create plot data using ddply() func
# instead, you can the aggregate() func(right of ~, year + type)
Baltimore.type.year <- ddply(BaltimoreCity, .(year, type), function(x){ sum(x$Emissions) })
colnames(Baltimore.type.year)[3] <- "Emissions"

# Create a new device
png("plot3.png")

# Draw a plot using ggplot2 on the device
qplot(year, Emissions, data=Baltimore.type.year, color=type, geom="line") +
  ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emissions by Type and Year")) +
  xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))

# Close the device
dev.off()