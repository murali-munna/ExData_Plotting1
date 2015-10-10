setwd("E:/Data Science/EDA")

wholeData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

febData <- subset(wholeData, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(febData$Global_active_power)
Sub_metering_1 <- as.numeric(febData$Sub_metering_1)
Sub_metering_2 <- as.numeric(febData$Sub_metering_2)
Sub_metering_3 <- as.numeric(febData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, Sub_metering_1, type = "l", col = "black", xlab="", ylab = "Energy sub metering")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1.5)
dev.off()
