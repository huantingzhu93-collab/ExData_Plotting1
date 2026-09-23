# plot2.R
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
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
