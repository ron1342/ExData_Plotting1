# Coursera - Exploratory Analysis Course

## Week 1 - Project 1


## The first thing to do is to load the data. We will assume that
## the file is in the working directory
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Plot 3

## Next we subset the data for the dates we are interested in working with and transform the variable
## that we want to plot into numeric values. We store this subset in "d0123"
d0123 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## In this plot, we also create a new variable called "Dayandtime". It is a combination of the
## "Date" and "Time" variables.
d0123$Dayandtime <- as.POSIXct(paste(d0123$Date, d0123$Time), format = "%Y-%m-%d %H:%M:%S")


d0123$Sub_metering_1 <- as.numeric(as.character(d0123$Sub_metering_1))
d0123$Sub_metering_2 <- as.numeric(as.character(d0123$Sub_metering_2))
d0123$Sub_metering_3 <- as.numeric(as.character(d0123$Sub_metering_3))


png(filename = "plot3.png")
with(d0123, plot(Dayandtime, Sub_metering_1, type= "n", xlab ="",  ylab = "Energy sub metering"))

with(d0123, lines(Dayandtime, Sub_metering_1))
with(d0123, lines(Dayandtime, Sub_metering_2, col = "red"))
with(d0123, lines(Dayandtime, Sub_metering_3, col = "blue"))

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1,
       text.width = 40000)
dev.off()
