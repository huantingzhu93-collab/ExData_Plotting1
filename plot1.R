# plot1.R
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

# Create the plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
