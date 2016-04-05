# Exploratory Data Analysis: Assignment 1, Plot 1
# Histogram of Global Active Power (kw)
# Dataset: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

# Reading data, then subsetting for dates of interest (2007-02-01 and 2007-02-02)...
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date_subset <- power_data[which(power_data$Date %in% c("1/2/2007", "2/2/2007")), ]

# Creating histogram and saving as png to working directory... 
plot1 <- hist(as.numeric(as.character(date_subset$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
plot1
dev.copy(png,'plot1.png')
dev.off()