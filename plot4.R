data <- read.table('../household_power_consumption.txt', header = TRUE, sep = ';')
subdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]
subdata <- transform(subdata, Global_active_power = as.numeric(as.character(Global_active_power)))
subdata <- transform(subdata, Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
subdata <- transform(subdata, Voltage = as.numeric(as.character(Voltage)))
subdata <- transform(subdata, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
subdata <- transform(subdata, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
subdata <- transform(subdata, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
subdata <- transform(subdata, Time = as.POSIXlt(paste(as.Date(Date, "%d/%m/%Y"), as.character(Time))))
xrange <- range(subdata$Time)

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

yrange <- range(subdata$Global_active_power)
plot(xrange, yrange, ylab="Global Active Power", xlab="")
lines(subdata$Time, subdata$Global_active_power)

yrange <- range(subdata$Voltage)
plot(xrange, yrange, ylab="Voltage", xlab="datetime")
lines(subdata$Time, subdata$Voltage)

yrange <- range(c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3))
plot(xrange, yrange, ylab="Energy sub metering", xlab="")
lines(tdata$Time, tdata$Sub_metering_1)
lines(tdata$Time, tdata$Sub_metering_2, col="Red")
lines(tdata$Time, tdata$Sub_metering_3, col="Blue")
ltime <- subdata[750,]$Time
legend(ltime, 35, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

yrange <- range(subdata$Global_reactive_power)
plot(xrange, yrange, ylab="Global_reactive_power", xlab="datetime")
lines(subdata$Time, subdata$Global_reactive_power)

dev.off()