## ------------ Boilerplate ------------
## Coursera Course: Exploratory Data Analysis exdata-031
## Project 1 
## Created by Mihaly Garamvolgyi, 2015-08-05
##

## setwd("~/Repositories/Exporatory/Project 1")

## ----- Read data ---------------
ConsData <- read.table("./household_power_consumption.txt", 
                           header=TRUE, 
                           sep=";", 
                           stringsAsFactors=FALSE, 
                           dec=".")

## str(ConsData)

## ----- Filter data ---------------
ConsData <- ConsData[(ConsData$Date == "1/2/2007" | ConsData$Date == "2/2/2007"), ]

## ----- Convert data ---------------
ConsData$Date_time <- strptime(paste(ConsData$Date, ConsData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ConsData$Global_active_power <- as.numeric(ConsData$Global_active_power)
ConsData$Global_reactive_power <- as.numeric(ConsData$Global_reactive_power)
ConsData$Voltage <- as.numeric(ConsData$Voltage)
ConsData$Sub_metering_1 <- as.numeric(ConsData$Sub_metering_1)
ConsData$Sub_metering_2 <- as.numeric(ConsData$Sub_metering_2)
ConsData$Sub_metering_3 <- as.numeric(ConsData$Sub_metering_3)

## ----- Plotting Mulitdiagram  ---------------

# par(mfrow = c(2, 2))
# with(ConsData, {
#   plot(ConsData$Date_time, ConsData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#   plot(ConsData$Date_time, ConsData$Voltage, type="l", xlab="datetime", ylab="Voltage")
#   plot(ConsData$Date_time, ConsData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#     lines(ConsData$Date_time, ConsData$Sub_metering_2, col="red")
#     lines(ConsData$Date_time, ConsData$Sub_metering_3, col="blue")
#     legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#   plot(ConsData$Date_time, ConsData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
# })

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(ConsData, {
  plot(ConsData$Date_time, ConsData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(ConsData$Date_time, ConsData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(ConsData$Date_time, ConsData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(ConsData$Date_time, ConsData$Sub_metering_2, col="red")
  lines(ConsData$Date_time, ConsData$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(ConsData$Date_time, ConsData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()



