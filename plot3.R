power <- subset(read.csv("household_power_consumption.txt",  header=TRUE, sep=';', 
                         na.strings="?", check.names=FALSE, 
                         quote='\"',  stringsAsFactors=FALSE, comment.char=""), 
                Date %in% c("1/2/2007","2/2/2007"))



power$Date <- as.Date(power$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(dateTime)


png("plot3.png", height=480, width=480)

plot(power$Sub_metering_1 ~ power$Datetime, type="l",
     xlab="", ylab="Energy sub metering")

lines(power$Sub_metering_2 ~ power$Datetime,col='Red')
lines(power$Sub_metering_3 ~ power$Datetime,col='Blue')


legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2 )




dev.off()