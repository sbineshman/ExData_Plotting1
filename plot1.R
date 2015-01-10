library(dplyr)
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE,  as.is=TRUE) 
newFile$DateTime <- paste(newFile$Date, newFile$Time)
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")

subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("200-02-02 00:00:00"))


hist(subsetted$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()