## Get dataset
housepower_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
housepower_full$Date <- as.Date(housepower_full$Date, format="%d/%m/%Y")

## Subset and convert data
data <- subset(housepower_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2 and save
png("plot2.png", width = 480, height = 480)
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
