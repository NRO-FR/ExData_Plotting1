# Script to reproduce the fist graph as png
#call the library used
library(sqldf)

#read the file and use sqldf library to filter by Date value
dt <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")

#changing Date value to Date format
library(lubridate)
dt$Date<-with(dt, dmy(Date) + hms(Time))

#open the "device" png file to write in
png(filename = "plot3.png",width = 480,height = 480)

# create the plot
with(dt,plot(Date,Sub_metering_1,
              type = "l",
              xlab="",
              ylab="Energy sub metering"))

with(dt,lines(Date,Sub_metering_2,col="red"))
with(dt,lines(Date,Sub_metering_3,col="blue"))
legend("topright",
       lty=1,
       legend=c("Submetering_1","Submetering_2","Submetering_3"),
       col = c("black","red","blue"))

# close the current device (png file)
dev.off()
