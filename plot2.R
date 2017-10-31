library(dplyr)
library(magrittr)
dsplot2<-read.table("household_power_consumption.txt",header = TRUE,sep = ';')

dsplot2$Date=as.Date(dsplot2$Date,"%d/%m/%Y")

dsplot2$Global_active_power=
  as.numeric(levels(dsplot2$Global_active_power))[dsplot2$Global_active_power]

dsplot2<-dsplot2%>%
  filter(dsplot2$Date=="2007-02-01" |dsplot2$Date=="2007-02-02" )

dsplot2$Date <- paste(dsplot2$Date, dsplot2$Time)

dsplot2$Date=strptime(dsplot2$Date,format = "%Y-%m-%d %H:%M:%S")

plot(dsplot2$Date, dsplot2$Global_active_power,type = "l",xlab = "",ylab="Global Active Power(Kilowatts)")

dev.copy(png,"plot2.png")

dev.off()