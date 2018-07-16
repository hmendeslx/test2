# Explanatory Data Analysis - Plot3
#

## Clean workspace
rm(list=ls(all=TRUE))

setwd("D:/edu/JohnsHopkins/ExplanatoryData/R")
data <- read.table("household_power_consumption.txt", sep=";", header=T)


# convert from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))


# convert from factor to date
data$Date1 <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Date_Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

data_to_plot <- subset(data, data$Date1 >= as.Date("01/02/2007", "%d/%m/%Y") 
                       &  data$Date1 <= as.Date("02/02/2007", "%d/%m/%Y"))

par(mfrow=c(2,2))

plot(data_to_plot$Date_Time, data_to_plot$Global_active_power, type ="l", 
     xlab="", ylab="Global Active Power (Kilowats)")

plot(data_to_plot$Date_Time, data_to_plot$Voltage, type ="l", 
     xlab="datetime", ylab="Voltage")


plot(data_to_plot$Date_Time, data_to_plot$Sub_metering_1, type ="l", 
     xlab="", ylab="Energy sub metering")
points(data_to_plot$Date_Time, data_to_plot$Sub_metering_2, type ="l", col="red")
points(data_to_plot$Date_Time, data_to_plot$Sub_metering_3, type ="l", col="blue")
legend("topright",c("Sub_metering_1",  "Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), cex=0.3,  bty="n", lty=1)


plot(data_to_plot$Date_Time, data_to_plot$Global_reactive_power, type ="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Default = 480x480 px
dev.copy(png, "plot4.png")
dev.off()


# reset default nber windows
par(mfrow=c(1,1))



