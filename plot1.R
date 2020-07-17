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

## Plot 1

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
