# Load libraries
library(plyr)
library(ggplot2)

# Read data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Subset coal combustion
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
combustionCoal <- (combustionRelated & coalRelated)
combustionSCC <- SCC[combustionCoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

# Create a new device
png("plot4.png")

# Draw a plot using ggplot2 on the device
gp <- ggplot(combustionNEI, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "grey", width = 0.75) +
  theme_bw() + guides(fill=FALSE) +
  labs(x = "year", y = expression("Total " ~ PM[2.5] ~ " * Emission (Tons)")) +
  labs(title=expression(PM[2.5] ~ " * Coal Combustion Emission Across US from 1999 ~ 2008"))

print(gp)

# Close the device
dev.off()