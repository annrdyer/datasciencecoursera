## This script reads electric power consumption data obtained from the UC Irvine Machine Learning Repository.
## A time series plot of Energy Sub Metering by Meter # is generated and saved to a PNG file.


## Read in data from working directory
powerData <- read.table("./household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?",
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create datetime and date variables
powerData$datetime <- strptime( paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


## Subset data for Feb 1 and Feb 2 2007
powerPlot3 <- subset(powerData, powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", select=c(datetime, Sub_metering_1, Sub_metering_2, Sub_metering_3))


## Create time series plot of Energy Sub Metering by Meter #
png(filename="plot3.png",width=480,height=480,units="px")

plot(powerPlot3$datetime, powerPlot3$Sub_metering_1, type="l", col="black", main="", ylab="Energy sub metering", xlab="")
points(powerPlot3$datetime, powerPlot3$Sub_metering_2, type="l", col="red")
points(powerPlot3$datetime, powerPlot3$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue") )

dev.off()


