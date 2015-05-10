#Changing the LC_TIME local, so days are in English (Windows)
#Sys.setlocale("LC_TIME", "English")

initial <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, nrows=100, na.strings = "?")
classes <- sapply(initial, class)
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=FALSE, nrows=2880, comment.char="", colClasses=classes, na.strings = "?", skip=66637, col.names=colNames)

data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())

png('plot3.png', width=480, height=480, units="px")
with(data, {
    plot(DateTime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering", main="")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
})
dev.off()
