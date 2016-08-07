# Coursera - Exploratory Analysis Course

## Week 1 - Project 1


## The first thing to do is to load the data. We will assume that
## the file is in the working directory
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Plot 2

## Next we subset the data for the dates we are interested in working with and transform the variable
## that we want to plot into numeric values.
d0123 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
d0123$Global_active_power <- as.numeric(as.character(d0123$Global_active_power))
d0123$Dayandtime <- as.POSIXct(paste(d0123$Date, d0123$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")
with(d0123, plot(Dayandtime, Global_active_power, type= "l", xlab ="",  ylab = "Global Active Power (kilowatts)"))
dev.off()