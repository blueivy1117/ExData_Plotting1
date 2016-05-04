#set work directory
setwd("/Users/zhanghaichen/Documents/data/")

#read data into matrix
raw <- read.table("household_power_consumption.txt",header=T,sep=";")

#subset the data of 2007-2-1 and 2007-2-2 data
sub <- raw[raw$Date %in% c("1/2/2007","2/2/2007"),]
row.names(sub) <- NULL
globalactivepower <- as.numeric(levels(sub$Global_active_power))[sub$Global_active_power]
Time_Date <- strptime(paste(sub$Date,sub$Time),format= '%d/%m/%Y %H:%M:%S')

#plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(Time_Date,globalactivepower,type="l",xlab="",ylab="Global Active Power (killowatts)")
dev.off()
