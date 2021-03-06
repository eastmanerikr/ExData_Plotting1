library(readr)
library(httr)
library(lubridate)

Energy_Data <- read_delim(file = "https://raw.githubusercontent.com/eastmanerikr/ExData_Plotting1/master/household_power_consumption.txt?_sm_au_=iVVrPsRwRnDqwtZ5",  col_names = TRUE, delim = ";")

Energy_Data$Date <- strptime(Energy_Data$Date, format = "%m/%d/%Y")

Energy_Data$Date <- with(Energy_Data, ydm(Date) + hms(Time), format = "%m/%d/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")


par(mfcol=c(2,2))

plot(Energy_Data$Date, Energy_Data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", col = "black")

plot(Energy_Data$Date, Energy_Data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(Energy_Data$Date, Energy_Data$Sub_metering_2, type = "l", col = "red")
lines(Energy_Data$Date, Energy_Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"), text.col = "black")
                                                                                                            
plot(Energy_Data$Date, Energy_Data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")

plot(Energy_Data$Date, Energy_Data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")

dev.off()