# Week 4 - Assignment - course project 2

# Plot1
# Reading the files
pm25us <- readRDS("summarySCC_PM25.rds")
sourcepm25 <- readRDS("Source_Classification_Code.rds")
# I compute the sum of emissions per year before plotting
pm25totalPerYear <- aggregate(Emissions ~ year, pm25us, sum)
# I Generate plot 1 using Base plotting system
barplot(pm25totalPerYear$Emissions, names.arg = c("1999", "2002", "2005", "2008"), ylab = "PM25 Emissions (tons)", xlab = "Year", col = "red", main = "PM25 Emissions evolution US")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off() # Shut down the device
