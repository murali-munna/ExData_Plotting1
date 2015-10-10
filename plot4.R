setwd("E:/Data Science/EDA")

wholeData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

febData <- subset(wholeData, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


GlobalActivePower <- as.numeric(febData$Global_active_power)
Sub_metering_1 <- as.numeric(febData$Sub_metering_1)
Sub_metering_2 <- as.numeric(febData$Sub_metering_2)
Sub_metering_3 <- as.numeric(febData$Sub_metering_3)
Voltage <- as.numeric(febData$Voltage)
GlobalReactivePower <- as.numeric(febData$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, Sub_metering_1, type = "l", col = "black", xlab="", ylab = "Energy sub metering")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1.5)

plot(datetime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
