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
plot(fl$DateTime, fl$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

##Save plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()