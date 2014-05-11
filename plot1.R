# Read and subset data
data <- read.csv('household_power_consumption.txt', sep = ';', as.is=TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create plot
png('plot1.png', width=480, height=480)
hist(data$Global_active_power/500, 
     col='RED', 
     xlab='Global Active Power (kilowatts)', 
     main='Global Active Power')
dev.off()
