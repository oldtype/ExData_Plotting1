## plot2.R

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
with(data, plot(Datetime, Global_active_power, type="l",
                xlab="", 
                ylab="Global Active Power (kilowatts)"))

# copy plot to image
dev.copy(png, "plot2.png")
dev.off()