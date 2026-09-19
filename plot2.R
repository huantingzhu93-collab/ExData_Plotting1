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
png("plot2.png", width = 480, height = 480)
plot(subsetData$DateTime, subsetData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
