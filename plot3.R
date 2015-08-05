##Read the data
fl <- read.csv("./Data/household_power_consumption.txt", header=T, 
               sep=";", na.strings="?", comment.char="", check.names=F,
               stringsAsFactors=F)

##Keep only relevant days (2007-02-01, 2007-02-02)
fl <- fl[fl$Date %in% c("1/2/2007","2/2/2007"),]

##Prepare vars
fl$DateTime <- as.POSIXct(strptime(paste(fl$Date, fl$Time, sep=" "),
                                   "%d/%m/%Y %H:%M:%S"))

##Plot
plot(fl$Sub_metering_1~fl$DateTime, type="l",
     ylab="Energy sub metering", xlab="")
lines(fl$Sub_metering_2~fl$DateTime,col='Red')
lines(fl$Sub_metering_3~fl$DateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save plot to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()