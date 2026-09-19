# Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for the two days
subsetData <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create DateTime column
datetime <- paste(subsetData$Date, subsetData$Time)
subsetData$DateTime <- as.POSIXct(datetime)

# Create the plot and save as PNG
png("plot3.png", width = 480, height = 480)
plot(subsetData$DateTime, subsetData$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subsetData$DateTime, subsetData$Sub_metering_2, col = "red")
lines(subsetData$DateTime, subsetData$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()
