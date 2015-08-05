##Read the data
fl <- read.csv("./Data/household_power_consumption.txt", header=T, 
               sep=";", na.strings="?", comment.char="", check.names=F,
               stringsAsFactors=F)

##Keep only relevant days (2007-02-01, 2007-02-02)
fl <- fl[fl$Date %in% c("1/2/2007","2/2/2007"),]

##Plot
hist(fl$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

##Save plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()