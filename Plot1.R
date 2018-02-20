#Read data 
df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?")) 

# Change dates
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Change time
df$Time <- strptime(paste(df$Date, df$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")

# Select the days 2007-02-01 and 2007-02-02
data <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# plot to png file
png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
