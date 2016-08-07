# Coursera - Exploratory Analysis Course

## Week 1 - Project 1


## The first thing to do is to load the data. We will assume that
## the file is in the working directory
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Plot 1

## Next we subset the data for the dates we are interested in working with.
d12 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## We also need to transform the variable that we want to plot into numeric
d12$Global_active_power <- as.numeric(as.character(d12$Global_active_power))
png(filename = "plot1.png")
with(d12, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Activer Power (kilowatts)"))
dev.off()
