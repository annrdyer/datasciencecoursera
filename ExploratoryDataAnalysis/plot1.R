## This script reads electric power consumption data obtained from the UC Irvine Machine Learning Repository.
## A histogram of Global Active Power is generated and saved to a PNG file.


## Read in data from working directory
powerData <- read.table("./household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?",
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))


## Create datetime and date variables
powerData$datetime <- strptime( paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


## Subset data for Feb 1 and Feb 2 2007
powerPlot1 <- subset(powerData, powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", select=c(Date, Global_active_power))


## Create histogram of Global Active Power
png(filename="plot1.png",width=480,height=480,units="px")

hist(powerPlot1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()