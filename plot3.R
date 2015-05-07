setwd("~/github//RGraphs/ExData_Plotting1/")

n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data1 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=1440, stringsAsFactors = F)
data2 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("2/2/2007", readLines("household_power_consumption.txt")), nrows=1440, stringsAsFactors = F)

data <- rbind(data1, data2)

d <- paste(data$Date, data$Time, sep=" ")
d <- strptime(d, "%d/%m/%Y %H:%M:%S")
s1 <- data$Sub_metering_1
s2 <- data$Sub_metering_2
s3 <- data$Sub_metering_3

png("plot3.png")

plot(d, s1, type="n", ylab = "Energy Sub Metering", xlab="")

lines(d, s1)
lines(d, s2, col="red")
lines(d, s3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()