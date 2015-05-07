setwd("~/github//RGraphs/ExData_Plotting1/")

n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data1 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=1440, stringsAsFactors = F)
data2 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("2/2/2007", readLines("household_power_consumption.txt")), nrows=1440, stringsAsFactors = F)

data <- rbind(data1, data2)

d <- paste(data$Date, data$Time, sep=" ")
d <- strptime(d, "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(d, data[,3], ylab="Global Active Power (kilowatts)", type="n", xlab = "")
lines(d, data[,3])

dev.off()