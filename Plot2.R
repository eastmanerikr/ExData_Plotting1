library(readr)
library(httr)
library(lubridate)

Energy_Data <- read_delim(file = "https://raw.githubusercontent.com/eastmanerikr/ExData_Plotting1/master/household_power_consumption.txt?_sm_au_=iVVrPsRwRnDqwtZ5",  col_names = TRUE, delim = ";")

Energy_Data$Date <- strptime(Energy_Data$Date, format = "%m/%d/%Y")

Energy_Data$Date <- with(Energy_Data, ydm(Date) + hms(Time), format = "%m/%d/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(Energy_Data$Date, Energy_Data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()