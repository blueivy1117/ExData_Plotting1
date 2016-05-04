#set work directory
setwd("/Users/zhanghaichen/Documents/data/")

#read data into matrix
raw <- read.table("household_power_consumption.txt",header=T,sep=";")

#subset the data of 2007-2-1 and 2007-2-2 data
sub <- raw[raw$Date %in% c("1/2/2007","2/2/2007"),]
row.names(sub) <- NULL
Time_Date <- strptime(paste(sub$Date,sub$Time),format= '%d/%m/%Y %H:%M:%S')

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(Time_Date,as.character(sub$Global_active_power),xlab="",ylab="Global Active Power",type="l")
plot(Time_Date,as.character(sub$Voltage),xlab="datetime",ylab="Voltage",type="l")
plot(Time_Date,as.character(sub$Sub_metering_1),type="l",xlab="",col="black",ylim=range(c(sub$Sub_metering_1,sub$Sub_metering_2,sub$Sub_metering_3)),ylab="Energy Sub Metering")
par(new=T)
plot(Time_Date,as.character(sub$Sub_metering_2),type="l",xlab="",col="red",ylim=range(c(sub$Sub_metering_1,sub$Sub_metering_2,sub$Sub_metering_3)),ylab="")
par(new=T)
plot(Time_Date,as.character(sub$Sub_metering_3),type="l",xlab="",col="blue",ylim=range(c(sub$Sub_metering_1,sub$Sub_metering_2,sub$Sub_metering_3)),ylab="")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
plot(Time_Date,as.character(sub$Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()