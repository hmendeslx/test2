# Explanatory Data Analysis - Plot1
#

## Clean workspace
rm(list=ls(all=TRUE))

setwd("/resources/rstudio/work/test2/data")
data <- read.table("household_power_consumption.txt", sep=";", header=T)

# convert from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# convert from factor to date
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")

data_to_plot <- subset(data, data$Date >= as.Date("01/02/2007", "%d/%m/%Y") 
                       &  data$Date <= as.Date("02/02/2007", "%d/%m/%Y"))

hist(data_to_plot$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (Kilowats)")

# Default = 480x480 px
setwd("/resources/rstudio/work/test2/results")
dev.copy(png, "plot1.png")
dev.off()
