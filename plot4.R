# Read and subset data
# Read and subset data
data <- read.csv('household_power_consumption.txt', sep = ';', as.is=TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

data$datetime <- paste(data$Date, data$Time, sep='_')
data$datetime <- strptime(data$datetime, format='%d/%m/%Y_%H:%M:%S')
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# Create plot
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))

#Global Active Power plot
plot(data$datetime, data$Global_active_power/500, 
     col='WHITE', pch='.',
     xlab='', ylab='Global Active Power')
lines(data$datetime, data$Global_active_power/500)

#Voltage plot
plot(data$datetime, data$Voltage,
     col='WHITE', pch='.',
     xlab='datetime', ylab='Voltage')
lines(data$datetime, data$Voltage)

#Energy sub metering plot
plot(data$datetime, data$Sub_metering_1,
     col='WHITE', pch='.',
     xlab='', ylab='Energy sub metering',
     yaxp=c(0,30,3), ylim=c(0,40))
lines(data$datetime, data$Sub_metering_1, col='black')
lines(data$datetime, data$Sub_metering_2, col='red')
lines(data$datetime, data$Sub_metering_3, col='blue')
legend('topright', lwd=1, lty=c(1,1), bty='n',
       col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Global_reactive_power plot
plot(data$datetime, data$Global_reactive_power,
     col='WHITE', pch='.',
     xlab='datetime', ylab='Global_reactive_power')
lines(data$datetime, data$Global_reactive_power)

dev.off()
