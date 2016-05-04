#set work directory
setwd("/Users/zhanghaichen/Documents/data/")

#read data into matrix
raw <- read.table("household_power_consumption.txt",header=T,sep=";")

#subset the data of 2007-2-1 and 2007-2-2 data
sub <- raw[raw$Date %in% c("1/2/2007","2/2/2007"),]
row.names(sub) <- NULL
sub$Global_active_power <- as.numeric(levels(sub$Global_active_power))[sub$Global_active_power]

#plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(sub$Global_active_power,col="red",xlab="Global Active Power (killowatts)",main="Global Active Power")
dev.off()
