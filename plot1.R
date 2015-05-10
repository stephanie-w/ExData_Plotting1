initial <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=100, na.strings = "?")
classes <- sapply(initial, class)
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, nrows=2880, comment.char="", colClasses=classes, na.strings = "?", skip=66637, col.names=colNames)

png('plot1.png', width=480, height=480, units="px")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

