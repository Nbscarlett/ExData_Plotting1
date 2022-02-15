## Loading the data
data <-read.table("/Users/liukuo/Desktop/coursera/explorotary\ data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
summary(dat)
GlobalActivePower <- as.numeric(dat$Global_active_power)

data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
datetime <- paste(as.Date(data$Date), data$Time)

data <- data %>%
        mutate(DateTime = paste(Date, Time, sep = ""))
data$DateTime <- as.POSIXct(data$DateTime)



### Plot 1
plot1 <- hist(GlobalActivePower,
              xlab = "Global Active Power (kilowatts)",
              col  = "red",
              main = "Global Active Power")



### Plot 2

plot2 <- plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "" )

### Plot 3

plot3 <- plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", type = "l", xlab = "")
lines(data$DateTime, data$Sub_metering_2, type = "l", , col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", , col = "blue")
legend("topright", c("Sub metering", "Sub metering 2", "Sub metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


### Plot 4


plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "Datetime")

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "Datetime")

plot4 <- par(mfrow =  c(2,2))
plot2 <- plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "" )
plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "Datetime")



plot3 <- plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", type = "l", xlab = "")
lines(data$DateTime, data$Sub_metering_2, type = "l", , col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", , col = "blue")
legend("topright", c("Sub metering", "Sub metering 2", "Sub metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "Datetime")

dev.copy(png,"myplot.png")
dev.off()

