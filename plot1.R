data <- read.table('../household_power_consumption.txt', header = TRUE, sep = ';')
subdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]
subdata <- transform(subdata, Global_active_power = as.numeric(as.character(Global_active_power)))
png(filename="plot1.png", width=480, height=480, units="px")
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()