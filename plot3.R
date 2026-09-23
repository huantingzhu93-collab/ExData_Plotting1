# plot3.R
# Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Subset the data for the required dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert Date and Time to POSIXct
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

# Set locale to English for date labels
Sys.setlocale("LC_TIME", "English")

# Create the plot
png("plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
