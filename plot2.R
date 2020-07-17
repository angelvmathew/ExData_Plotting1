## Getting full dataset

if (!file.exists("./household_power_consumption.txt")) {
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,destfile=paste0(getwd(),"/Power_consumption.zip"),method = "curl")
  unzip("Power_consumption.zip",exdir="./")
}
data <- read.table("./household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
