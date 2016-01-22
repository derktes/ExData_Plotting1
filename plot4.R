# Load dataset. We will only be using data from the dates 2007-02-01 and 2007-02-02.
power.consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert string to Date and Date/Time for column Date and Time
power.consumption <-subset(power.consumption, Date=="1/2/2007" | Date=="2/2/2007")
power.consumption$Time <- with(power.consumption, paste(Date, Time))
power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y")
power.consumption$Time <- strptime(power.consumption$Time, "%d/%m/%Y %H:%M:%S")

# Plotting to PNG device begins
png("plot4.png")

par(mfcol=c(2,2), mar=c(4, 4, 1, 1))

with(power.consumption, plot(Time, Global_active_power, type="n", ylab="Global Action Power", xlab=""))
with(power.consumption, lines(Time, Global_active_power))

with(power.consumption, 
     { plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="");
         lines(Time, Sub_metering_1, col="black");
         lines(Time, Sub_metering_2, col="red");
         lines(Time, Sub_metering_3, col="blue") })

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1, 1), lwd=c(2, 2, 2))

with(power.consumption, plot(Time, Voltage, type="n", ylab="Voltage", xlab="datetime"))
with(power.consumption, lines(Time, Voltage))

with(power.consumption, plot(Time, Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime"))
with(power.consumption, lines(Time, Global_reactive_power))

dev.off()