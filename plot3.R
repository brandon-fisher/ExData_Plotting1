# Set working directory - will change based on user
setwd("C:/Users/Brandon/Documents/R/Coursera")

# Load data
data <- read.csv("household_power_consumption.txt",
                 sep=";")

# Subset only dates required
subset_data <- subset(data, data$Date == "1/2/2007" |
                  data$Date == "2/2/2007")

# Create new column concatenating Date and Time
subset_data$DateTime <- paste(subset_data$Date, subset_data$Time)
subset_data$DateTime <- strptime(subset_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open graphic dvice (png)
png(filename = "plot3.png", width = 480, height = 480)

# Plot 3
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l",
     col  = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright",
       pch = '___',
       border = "white",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close graphic device
dev.off()