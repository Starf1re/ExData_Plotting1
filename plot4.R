power <- subset(read.csv("household_power_consumption.txt",  header=TRUE, sep=';', 
                         na.strings="?", check.names=FALSE, 
                         quote='\"',  stringsAsFactors=FALSE, comment.char=""), 
                Date %in% c("1/2/2007","2/2/2007"))



power$Date <- as.Date(power$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(dateTime)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,1,2,0))

with(power, {
        
        plot(Global_active_power~Datetime, type="l", xlab="",
             ylab="Global Active Power")
        
        plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
        
        plot(Sub_metering_1 ~ Datetime, type="l", xlab="", 
             ylab="Energy sub metering")
        
        lines(Sub_metering_2 ~ Datetime,col='Red')
        lines(Sub_metering_3 ~ Datetime,col='Blue')
        
        legend("topright", col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1, lwd=2, bty="n")
        
        plot(Global_reactive_power ~ Datetime, type="l", 
             ylab="Global_reactive_power",xlab="datetime")
})



dev.copy(png, file="plot4.png", height=480, width=480)


dev.off()