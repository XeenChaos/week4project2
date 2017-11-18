# Week 4 - Assignment - course project 2

# Plot2
# Reading the files
pm25us <- readRDS("summarySCC_PM25.rds")
sourcepm25 <- readRDS("Source_Classification_Code.rds")
# I extract a subset of data : only the observations corresponding to the city of Baltimore City
pm25BC <- subset(pm25us, fips == "24510")
# I compute the sum of emissions per year before plotting
pm25BCtotalPerYear <- aggregate(Emissions ~ year, pm25BC, sum)
# I Generate plot 2 using Base plotting system
barplot(pm25BCtotalPerYear$Emissions, names.arg = c("1999", "2002", "2005", "2008"), ylab = "PM25 Emissions (tons)", xlab = "Year", col = "blue", main = "PM25 Emissions evolution Baltimore City")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off() # Shut down the device
