# Exploratory Data Analysis: Assignment 1, Plot 3
# Overlayed line plot for 3 energy sub-meters over time for 2007-02-01 and 2007-02-02
# Dataset: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

# Reading data, then subsetting for dates of interest (2007-02-01 and 2007-02-02)...
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date_subset <- power_data[which(power_data$Date %in% c("1/2/2007", "2/2/2007")), ]

# Formatting date/time info in format 'm/d/y h:m:s'
dates <- as.Date(date_subset$Date, "%d/%m/%Y")
times <- date_subset$Time
datetime <- as.POSIXct(paste(dates, times))

# Formatting meter data to numeric class...
meter1 <- as.numeric(as.character(date_subset$Sub_metering_1))
meter2 <- as.numeric(as.character(date_subset$Sub_metering_2))
meter3 <- as.numeric(as.character(date_subset$Sub_metering_3))

# Creating plot and saving as png to working directory... 
plot3 <- {
  plot(datetime, meter1, type = 'l', ylim = range(meter1), xlab = "", ylab = "")
  par(new = T)
  plot(datetime, meter2, type = 'l', ylim = range(meter1), col = "red", 
	xlab = "", ylab = "")
  par(new = T)
  plot(datetime, meter3, type = 'l', ylim = range(meter1), col = "blue", 
	xlab = "", ylab = "Energy sub metering")
  legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1),
	col = c("black", "red", "blue"), cex = 0.9)
  }
plot3
dev.copy(png,'plot3.png')
dev.off()