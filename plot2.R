power <- subset(read.csv("household_power_consumption.txt",  header=TRUE, 
                         sep=';', na.strings="?", check.names=FALSE, 
                         quote='\"',  stringsAsFactors=FALSE, comment.char=""), 
                 Date %in% c("1/2/2007","2/2/2007"))

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(dateTime)


plot(power$Global_active_power~power$Datetime, type="l",
      xlab="",  ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

