# Read and subset data
data <- read.csv('household_power_consumption.txt', sep = ';', as.is=TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

data$datetime <- paste(data$Date, data$Time, sep='_')
data$datetime <- strptime(data$datetime, format='%d/%m/%Y_%H:%M:%S')
data$day <- weekdays(as.Date(data$Date, format='%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create plot
png('plot2.png', width=480, height=480)
plot(data$datetime, data$Global_active_power/500, 
    col='WHITE', pch='.',
    xlab='', ylab='Global Active Power (kilowatts)')
lines(data$datetime, data$Global_active_power/500)
dev.off()