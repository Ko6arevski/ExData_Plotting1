table<-read.table("household_power_consumption.txt", header=T, sep=";", na.string= "?")
table$DateTime <-paste(table$Date, table$Time, sep = "/")
table$Date <- as.Date(table$Date, "%d/%m/%Y")
subframe<-subset(table, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
subframe$DateTime <- strptime(subframe$DateTime, "%d/%m/%Y/%H:%M:%S")
png("plot3.png",)
plot(subframe$DateTime, subframe$Sub_metering_1, type="n", 
     ylab = "Energy sub metering", xlab="")
lines(subframe$DateTime, subframe$Sub_metering_1, col="black")
lines(subframe$DateTime, subframe$Sub_metering_2, col="red")
lines(subframe$DateTime, subframe$Sub_metering_3, col="blue")
legend("topright",lty="solid", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

