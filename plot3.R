data <- read.table('../household_power_consumption.txt', header = TRUE, sep = ';')
subdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]
subdata <- transform(subdata, Global_active_power = as.numeric(as.character(Global_active_power)))
subdata <- transform(subdata, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
subdata <- transform(subdata, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
subdata <- transform(subdata, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
subdata <- transform(subdata, Time = as.POSIXlt(paste(as.Date(Date, "%d/%m/%Y"), as.character(Time))))
xrange <- range(subdata$Time)
yrange <- range(c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3))

png(filename="plot3.png", width=480, height=480, units="px")
plot(xrange, yrange, ylab="Energy sub metering")
lines(tdata$Time, tdata$Sub_metering_1)
lines(tdata$Time, tdata$Sub_metering_2, col="Red")
lines(tdata$Time, tdata$Sub_metering_3, col="Blue")
ltime <- subdata[1600,]$Time
legend(ltime, 30, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

dev.off()