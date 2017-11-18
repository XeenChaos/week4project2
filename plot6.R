# Week 4 - Assignment - course project 2

# Plot6
# I load the appropriate library for plotting : ggplot2
library(ggplot2)
# Reading the files
pm25us <- readRDS("summarySCC_PM25.rds")
sourcepm25 <- readRDS("Source_Classification_Code.rds")
# I extract a subset of data : only the observations corresponding to the city of Baltimore City
pm25BC <- subset(pm25us, fips == "24510")
# I extract a subset of data : only the observations corresponding to the city of Los Angeles
pm25LA <- subset(pm25us, fips == "06037")
# I bind the observations of the 2 data frames in a single one
pm25BCLA <- rbind(pm25BC, pm25LA)
# Next, I extract a subset of data : only the observations corresponding to the "ON-ROAD" type, which corresponds to motor vehicles
pm25bclaRoad <- subset(pm25BCLA, type == "ON-ROAD")
# I create a temporary data frame which will serve as a corresponding matrix for the naming of the city
templabel <- data.frame(c("24510", "06037"), c("Baltimore", "Los Angeles"))
# I assign names to the variables
colnames(templabel) <- c("fips", "names")
# I create a new variable in the dataset and search for the common key fips in the templabel dataframe and match the corresponding names
pm25bclaRoad$label = templabel$names[match(pm25bclaRoad$fips, templabel$fips)]
# I Generate plot 6 using ggplot2
initialplot <- ggplot(pm25bclaRoad, aes(factor(year), Emissions)) 
initialplot + geom_bar(stat="identity") + facet_grid(. ~ label) + xlab("Year") + ggtitle("PM25 Emissions Evolution - Los Angeles / Baltimore City")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot6.png", width = 480, height = 480)
dev.off() # Shut down the device
