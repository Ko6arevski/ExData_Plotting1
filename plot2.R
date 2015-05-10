table<-read.table("household_power_consumption.txt", header=T, sep=";", na.string= "?")
table$DateTime <-paste(table$Date, table$Time, sep = "/")
table$Date <- as.Date(table$Date, "%d/%m/%Y")
subframe<-subset(table, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
subframe$DateTime <- strptime(subframe$DateTime, "%d/%m/%Y/%H:%M:%S")
png("plot2.png",)
plot(subframe$DateTime, subframe$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
