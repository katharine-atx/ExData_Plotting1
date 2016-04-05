# Exploratory Data Analysis: Assignment 1, Plot 4
# Multipanel plots: 4 plots over time for 2007-02-01 and 2007-02-02
# Dataset: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# 4 plots over time: 
	# Global Active Power
	# Voltage
	# Energy Sub Metering (3 meters on same plot)
	# Global Reactive Power

# Reading data, then subsetting for dates of interest (2007-02-01 and 2007-02-02)...
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date_subset <- power_data[which(power_data$Date %in% c("1/2/2007", "2/2/2007")), ]

# Formatting date/time info in format 'm/d/y h:m:s'
dates <- as.Date(date_subset$Date, "%d/%m/%Y")
times <- date_subset$Time
datetime <- as.POSIXct(paste(dates, times))

# Formatting meter data to numeric class for plot3...
meter1 <- as.numeric(as.character(date_subset$Sub_metering_1))
meter2 <- as.numeric(as.character(date_subset$Sub_metering_2))
meter3 <- as.numeric(as.character(date_subset$Sub_metering_3))

# Define plot panel layout (2 x 2), fill column-wise...
par(mfcol = c(2, 2))

# Define 4 plot panels...

plot2 <- plot(datetime, as.numeric(as.character(date_subset$Global_active_power)), 
	type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
	
plot3 <- {
  plot(datetime, meter1, type = 'l', ylim = range(meter1), xlab = "", ylab = "")
  par(new = T)
  plot(datetime, meter2, type = 'l', ylim = range(meter1), col = "red",	xlab = "", ylab = "")
  par(new = T)
  plot(datetime, meter3, type = 'l', ylim = range(meter1), col = "blue", xlab = "", 
	ylab = "Energy sub metering")
  legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.7, bty = "n")
  }
  
plot_volts <- plot(datetime, as.numeric(as.character(date_subset$Voltage)), 
	type = 'l', ylab = "Voltage")

plot_grp <- plot(datetime, as.numeric(as.character(date_subset$Global_reactive_power)), 
	type = 'l', ylab = "Global_reactive_power")

# Saving plot as png to working directory... 
dev.copy(png,'plot4.png')
dev.off()