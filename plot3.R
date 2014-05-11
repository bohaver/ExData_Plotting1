# Read and subset data
# Read and subset data
data <- read.csv('household_power_consumption.txt', sep = ';', as.is=TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

data$datetime <- paste(data$Date, data$Time, sep='_')
data$datetime <- strptime(data$datetime, format='%d/%m/%Y_%H:%M:%S')
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create plot
png('plot3.png', width=480, height=480)
plot(data$datetime, data$Sub_metering_1,
     col='WHITE', pch='.',
     xlab='', ylab='Energy sub metering',
     yaxp=c(0,30,3), ylim=c(0,40))
lines(data$datetime, data$Sub_metering_1, col='black')
lines(data$datetime, data$Sub_metering_2, col='red')
lines(data$datetime, data$Sub_metering_3, col='blue')
legend('topright', lwd=1, lty=c(1,1),
       col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()