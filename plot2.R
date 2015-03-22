# Read data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Subset of Baltimore City
BaltimoreCity <- subset(NEI, fips=="24510")

# Create plot data using aggregate() func
Baltimore.pd <- aggregate(Emissions ~ year, BaltimoreCity, sum)

# Open the new device
png("plot2.png", width=480, height=480, units="px")

# draw a plot on the device
plot(Baltimore.pd$year, Baltimore.pd$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the Baltimore City",
     xlab = "Year", ylab = "Emissions")

# Close the device
dev.off()