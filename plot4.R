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
png(filename = "plot4.png",width = 480,height = 480)

# define the plots canvas

par(mfcol=c(2,2))

# create the plot 1
with(dt,plot(Date,Global_active_power,
             type = "l",
             xlab="",
             ylab="Global Active Power (kilowatts)"))



# create the plot 2
with(dt,plot(Date,Sub_metering_1,
              type = "l",
              xlab="",
              ylab="Global Active Power (kilowatts)"))

with(dt,lines(Date,Sub_metering_2,col="red"))
with(dt,lines(Date,Sub_metering_3,col="blue"))

# create the plot 3
with(dt,plot(Date,Voltage,
             type = "l",
             xlab="datetime",
             ylab="Voltage"))

# create the plot 3
with(dt,plot(Date,Global_reactive_power,
             type = "l",
             xlab="datetime",
             ylab="Global reactive power"))

# close the current device (png file)
dev.off()
