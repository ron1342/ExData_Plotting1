# Coursera - Exploratory Analysis Course

## Week 1 - Project 1


## The first thing to do is to load the data. We will assume that
## the file is in the working directory
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


## Plot 4

## First we start the graphic device and then set the parameters for the multiple plots in one window.
png(filename = "plot4.png")
par(mfcol = c(2,2), mar = c(4,4,2,1))

#1
d0123 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
d0123$Global_active_power <- as.numeric(as.character(d0123$Global_active_power))
d0123$Dayandtime <- as.POSIXct(paste(d0123$Date, d0123$Time), format = "%Y-%m-%d %H:%M:%S")

with(d0123, plot(Dayandtime, Global_active_power, type= "l", xlab ="",  ylab = "Global Active Power (kilowatts)"))

#2
d0123 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
d0123$Global_active_power <- as.numeric(as.character(d0123$Global_active_power))
d0123$Dayandtime <- as.POSIXct(paste(d0123$Date, d0123$Time), format = "%Y-%m-%d %H:%M:%S")


d0123$Sub_metering_1 <- as.numeric(as.character(d0123$Sub_metering_1))
d0123$Sub_metering_2 <- as.numeric(as.character(d0123$Sub_metering_2))
d0123$Sub_metering_3 <- as.numeric(as.character(d0123$Sub_metering_3))



with(d0123, plot(Dayandtime, Sub_metering_1, type= "n", xlab ="",  ylab = "Energy sub metering"))

with(d0123, lines(Dayandtime, Sub_metering_1))
with(d0123, lines(Dayandtime, Sub_metering_2, col = "red"))
with(d0123, lines(Dayandtime, Sub_metering_3, col = "blue"))

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1,
       bty = "n")


#3
d0123$Voltage <- as.numeric(as.character(d0123$Voltage))

with(d0123, plot(Dayandtime, Voltage, type= "l", xlab ="datetime",  ylab = "Voltage"))

#4
d0123$Global_reactive_power <- as.numeric(as.character(d0123$Global_reactive_power))

with(d0123, plot(Dayandtime, Global_reactive_power, type= "l", xlab ="datetime"))

dev.off()