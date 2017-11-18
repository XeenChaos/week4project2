# Week 4 - Assignment - course project 2

# Plot3
# I load the appropriate library for plotting : ggplot2
library(ggplot2)
# Reading the files
pm25us <- readRDS("summarySCC_PM25.rds")
sourcepm25 <- readRDS("Source_Classification_Code.rds")
# I extract a subset of data : only the observations corresponding to the city of Baltimore City
pm25BC <- subset(pm25us, fips == "24510")
# I set the variable type as factor class, as I will use this varaible to differentiate the types and display them i a graph with 4 facets
pm25BC <- transform(pm25BC, type = factor(type))
# I Generate plot 3 using ggplot2
initialplot <- ggplot(pm25BC, aes(factor(year), Emissions)) 
# I indicate I want the graph to show 4 facets depending on the type
initialplot + geom_bar(stat="identity") + xlab("Year") + facet_grid(. ~ type) + ggtitle("PM25 Emissions Evolution per Source Type - Baltimore City")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot3.png", width = 640, height = 480)
dev.off() # Shut down the device
