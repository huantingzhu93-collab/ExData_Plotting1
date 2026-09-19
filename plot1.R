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

# Create the plot and save as PNG
png("plot1.png", width = 480, height = 480)
hist(subsetData$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
