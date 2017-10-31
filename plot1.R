library(dplyr)
library(magrittr)
dsplot1<-read.table("household_power_consumption.txt",header = TRUE,sep = ';')

dsplot1$Date=as.Date(dsplot1$Date,"%d/%m/%Y")

dsplot1$Time=strptime(dsplot1$Time)

dsplot1$Global_active_power=
  as.numeric(levels(dsplot1$Global_active_power))[dsplot1$Global_active_power]

dsplot1<-dsplot1%>%
  filter(dsplot1$Date=="2007-02-01" |dsplot1$Date=="2007-02-02" )

hist(dsplot1$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power(Kilowatts)")

dev.copy(png,"plot1.png")

dev.off()