# Exploratory Data Analysis: Assignment 1, Plot 2
# Plot of Global Active Power (kw) over time for 2007-02-01 and 2007-02-02
# Dataset: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

# Reading data, then subsetting for dates of interest (2007-02-01 and 2007-02-02)...
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date_subset <- power_data[which(power_data$Date %in% c("1/2/2007", "2/2/2007")), ]

# Formatting date/time info in format 'm/d/y h:m:s'
dates <- as.Date(date_subset$Date, "%d/%m/%Y")
times <- date_subset$Time
datetime <- as.POSIXct(paste(dates, times))

# Creating plot and saving as png to working directory... 
plot2 <- plot(datetime, as.numeric(as.character(date_subset$Global_active_power)), 
	type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
plot2
dev.copy(png,'plot2.png')
dev.off()