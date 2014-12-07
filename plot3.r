## The current directory contains the data file.
hpc<-read.csv("household_power_consumption.txt", sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

## dplyr package makes data filtering a bit easier
library("dplyr", lib.loc="~/R/win-library/3.1")
hpc_tbl<-tbl_df(hpc)
hpc_sel<-filter(hpc_tbl,Date == "1/2/2007" | Date=="2/2/2007")

## lubridate package helps managing dates and time.
library("lubridate", lib.loc="~/R/win-library/3.1")
hpc_m<-mutate(hpc_sel, DateAndTime = dmy(Date) + hms(Time))

## Plotting to a png file.
png(file="plot3.png", width=480, height= 480)

plot(x=hpc_m$DateAndTime, y=hpc_m$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=hpc_m$DateAndTime, y=hpc_m$Sub_metering_2, col="red")
lines(x=hpc_m$DateAndTime, y=hpc_m$Sub_metering_3, col="blue")
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
