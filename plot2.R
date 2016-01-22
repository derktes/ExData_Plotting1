# Load dataset. We will only be using data from the dates 2007-02-01 and 2007-02-02.
power.consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert string to Date and Date/Time for column Date and Time
power.consumption <-subset(power.consumption, Date=="1/2/2007" | Date=="2/2/2007")
power.consumption$Time <- with(power.consumption, paste(Date, Time))
power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y")
power.consumption$Time <- strptime(power.consumption$Time, "%d/%m/%Y %H:%M:%S")

# Plotting to PNG device begins
png("plot2.png")

with(power.consumption, plot(Time, Global_active_power, type="n", ylab="Global Action Power (kilowatts)", xlab=""))
with(power.consumption, lines(Time, Global_active_power))

dev.off()