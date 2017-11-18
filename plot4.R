# Week 4 - Assignment - course project 2

# Plot4
# I load the appropriate library for plotting : ggplot2
library(ggplot2)
# Reading the files
pm25us <- readRDS("summarySCC_PM25.rds")
sourcepm25 <- readRDS("Source_Classification_Code.rds")
# I create a new variable in the dataset and search for the common key SCC in the sourcepm25 dataframe and match the corresponding label 
pm25us$Sources = sourcepm25$SCC.Level.Three[match(pm25us$SCC, sourcepm25$SCC)]
# I extract the observations where we can find the string "coal" in the newly created variable
pm25coal <- pm25us[grepl("Coal", pm25us$Sources),]
# I Generate plot 4 using ggplot2
initialplot <- ggplot(pm25coal, aes(factor(year), Emissions)) 
initialplot + geom_bar(stat="identity") + xlab("Year") + ggtitle("PM25 Emissions Evolution for Coal Combustion-related Sources")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() # Shut down the device
