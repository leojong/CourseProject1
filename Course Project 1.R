myData <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";", colClasses = c("character"))
myRows <- (myData[,1] == "2/2/2007" | myData[,1] == "1/2/2007")
usedData <- myData[myRows,]

par (mfrow = c(1,1), mar = c(3,3,3,3))
# PLOT 1
hist(as.numeric(usedData$Global_active_power), main = "Global Active Power", col = 'red', xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()

# PLOT 2
plot (usedData$Global_active_power, type = 'l', xaxt = "n", ylab = "Global Active Power (kilowatts)" , xlab = "")
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))
dev.copy(png,'plot2.png')
dev.off()

# PLOT 3
with(usedData,{
    plot(as.numeric(Sub_metering_1), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n")
    points(as.numeric(Sub_metering_2), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n", col = 'red')
    points(as.numeric(Sub_metering_3), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n", col = 'blue')
})
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))
legend("topright",lty = 1, col = c('black','red','blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png')
dev.off()

# PLOT 4
par(mfrow = c(2,2),mar = c(2,2,2,2))

plot (usedData$Global_active_power, type = 'l', xaxt = "n", ylab = "Global Active Power (kilowatts)" , xlab = "")
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))

plot (usedData$Voltage, type = 'l', xaxt = "n", ylab = "Voltage" , xlab = "datetime")
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))

with(usedData,{
    plot(as.numeric(Sub_metering_1), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n")
    points(as.numeric(Sub_metering_2), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n", col = 'red')
    points(as.numeric(Sub_metering_3), type = 'l', ylab = "Energy Sub Metering" , xlab = "", xaxt = "n", col = 'blue')
})
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))
legend("topright",lty = 1, col = c('black','red','blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot (usedData$Global_reactive_power, type = 'l', xaxt = "n", ylab = "Global_reactive_power" , xlab = "datetime")
axis(1, c(1, length(usedData$Global_active_power) / 2 ,length(usedData$Global_active_power)), c("Thu","Fri","Sat"))

dev.copy(png,'plot4.png')
dev.off()


