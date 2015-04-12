## This script reads electric power consumption data obtained from the UC Irvine Machine Learning Repository.
## A multi-plot display of 4 plots is generated and saved to a PNG file.


## Read in data from working directory
powerData <- read.table("./household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?",
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create datetime and date variables
powerData$datetime <- strptime( paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

## Subset data for Feb 1 and Feb 2 2007
powerPlot4 <- subset(powerData, powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", select=c(datetime, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))


## Create multi-plot display of 4 plots
par(mfrow=c(2,2))
par(mar=c(4,4,2,1))


## plot 1: time series plot of Global Active Power
plot(powerPlot4$datetime, powerPlot4$Global_active_power, type="l",  cex.lab=.8, cex.axis=.75, main="", ylab="Global Active Power", xlab="")


## plot 2: time series plot of Voltage
plot(powerPlot4$datetime, powerPlot4$Voltage, type="l", cex.lab=.8, cex.axis=.75, main="", ylab="Voltage", xlab="datetime")


## plot 3: time series plot of Energy Sub Metering by Meter #
plot(powerPlot4$datetime, powerPlot4$Sub_metering_1, type="l", cex.lab=.8, cex.axis=.75, col="black", main="", ylab="Energy sub metering", xlab="")
points(powerPlot4$datetime, powerPlot4$Sub_metering_2, type="l", col="red")
points(powerPlot4$datetime, powerPlot4$Sub_metering_3, type="l", col="blue")
legend("topright", inset=.09, lty=1, cex=.70, bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue") )


## plot 4: time series plot of Global Reactive Power
plot(powerPlot4$datetime, powerPlot4$Global_reactive_power, type="l", cex.lab=.8,  cex.axis=.75, main="", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()

