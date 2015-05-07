setwd("~/github//RGraphs/ExData_Plotting1/")

n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data1 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=1440)
data2 <- read.table("household_power_consumption.txt", sep=";", col.names=n, na.strings = "?", skip=grep("2/2/2007", readLines("household_power_consumption.txt")), nrows=1440)

data <- rbind(data1, data2)

png("plot1.png")
hist(data[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()