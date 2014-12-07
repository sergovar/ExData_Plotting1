## The current directory contains the data file.
hpc<-read.csv("household_power_consumption.txt", sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

## dplyr package makes data filtering a bit easier
library("dplyr", lib.loc="~/R/win-library/3.1")
hpc_tbl<-tbl_df(hpc)
hpc_sel<-filter(hpc_tbl,Date == "1/2/2007" | Date=="2/2/2007")

## Plotting to a png file.
png(file="plot1.png", width=480, height= 480)
hist(hpc_sel$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
