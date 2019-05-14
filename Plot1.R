library(readr)
library(httr)

##You can run each file as is.
##The dataset is hosted on my Github
##The png file will write to your working directory.

Energy_Data <- read_delim(file = "https://raw.githubusercontent.com/eastmanerikr/ExData_Plotting1/master/household_power_consumption.txt?_sm_au_=iVVrPsRwRnDqwtZ5",  col_names = TRUE, delim = ";")


png(Energy_Data, "Plot1.png", width = 480, height = 480)
hist(Energy_Data$Global_active_power, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()