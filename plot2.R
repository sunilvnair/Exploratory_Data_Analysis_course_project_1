## Getting full dataset
read_my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
read_my_data$Date <- as.Date(read_my_data$Date, format="%d/%m/%Y")

## Subsetting the data
sub_data <- subset(read_my_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(read_my_data)

## Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(sub_data$Global_active_power~sub_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



