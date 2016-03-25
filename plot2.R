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
png(filename = "plot2.png", width = 480, height = 480)

# Plot 2
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power")

# Close graphic device
dev.off()