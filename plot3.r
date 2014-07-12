## Get dataset
housepower_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
housepower_full$Date <- as.Date(housepower_full$Date, format="%d/%m/%Y")

## Subset and convert data
data <- subset(housepower_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3 and save
png("plot3.png", width = 480, height = 480)
plot(data$Datetime, data$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

dev.off()
