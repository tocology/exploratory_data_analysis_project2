# Read data
NEI <- readRDS("./data/summarySCC_PM25.rds")

# Create plot data using aggregate() func
pd <- aggregate(Emissions ~ year, NEI, sum)

# make png file
png("plot1.png", width=480, height=480, units="px")

# draw plot on the device
plot(pd$year, pd$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")

# close device
dev.off()