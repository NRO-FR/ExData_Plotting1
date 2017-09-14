# Script to reproduce the fist graph as png
#call the library used
library(sqldf)

#read the file and use sqldf library to filter by Date value
dt <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")

#open the "device" png file to write in
png(filename = "plot1.png",width = 480,height = 480)

# create the histogram
with(dt,hist(Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))

# close the current device (png file)
dev.off()
