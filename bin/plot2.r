# Explanatory Data Analysis - Plot2
#

## Clean workspace
rm(list=ls(all=TRUE))

setwd("D:/Users/210906/Dropbox/edu/JohnsHopkins/ExplanatoryData/R")
data <- read.table("household_power_consumption.txt", sep=";", header=T)

# convert from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# convert from factor to date
data$Date1 <- as.Date(as.character(data$Date), "%d/%m/%Y")


data$Date_Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

data_to_plot <- subset(data, data$Date1 >= as.Date("01/02/2007", "%d/%m/%Y") 
                       &  data$Date <= as.Date("02/02/2007", "%d/%m/%Y"))

plot(data_to_plot$Date_Time, data_to_plot$Global_active_power, type ="l", 
     xlab="", ylab="Global Active Power (Kilowats)")

# Default = 480x480 px
dev.copy(png, "plot2.png")
dev.off()




