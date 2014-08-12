## plot4.R

# read data from text file
data <- read.table("./household_power_consumption.txt", sep = ";", 
                   header = FALSE, na.strings = "?",
                   nrows = 2880, skip=66637)

# add header names to dataset
names(data) = c("Date", "Time", "Global_active_power", 
                "Global_reactive_power", "Voltage", "Global_intensity", 
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# add new colum : Datetime
data$Datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# plot
Sys.setlocale("LC_TIME", "C")

par(mfrow = c(2, 2))

with(data, { 
    plot(Datetime, Global_active_power, type="l",
         xlab="", 
         ylab="Global Active Power")

    plot(Datetime, Voltage, type="l",
         xlab="datetime", 
         ylab="Voltage")
    
    plot(Datetime, Sub_metering_1, type="l",
         xlab="",
         ylab="Energy sub metering")
    lines(Datetime, Sub_metering_2, col="red")
    lines(Datetime, Sub_metering_3, col="blue") 
    legend("topright", lty=1, cex=0.7, bty="n", 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    plot(Datetime, Global_reactive_power, type="l",
         xlab="datetime")
})

# copy plot to image
dev.copy(png, "plot4.png")
dev.off()