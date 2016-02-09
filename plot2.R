data <- read.table('../household_power_consumption.txt', header = TRUE, sep = ';')
subdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]
subdata <- transform(subdata, Global_active_power = as.numeric(as.character(Global_active_power)))
subdata <- transform(subdata, Time = as.POSIXlt(paste(as.Date(Date, "%d/%m/%Y"), as.character(Time))))
xrange <- range(subdata$Time)
yrange <- range(subdata$Global_active_power)

png(filename="plot2.png", width=480, height=480, units="px")
plot(xrange, yrange, ylab="Global Active Power (kilowatts)")
lines(subdata$Time, subdata$Global_active_power)
dev.off()