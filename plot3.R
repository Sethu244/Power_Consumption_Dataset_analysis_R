library(dplyr)
library(magrittr)
dsplot3<-read.table("household_power_consumption.txt",header = TRUE,sep = ';')

dsplot3$Date=as.Date(dsplot3$Date,"%d/%m/%Y")

dsplot3$Global_active_power=
  as.numeric(levels(dsplot3$Global_active_power))[dsplot3$Global_active_power]

dsplot3<-dsplot3%>%
  filter(dsplot3$Date=="2007-02-01" |dsplot3$Date=="2007-02-02" )

dsplot3$Date <- paste(dsplot3$Date, dsplot3$Time)

dsplot3$Date=strptime(dsplot3$Date,format = "%Y-%m-%d %H:%M:%S")

dsplot3$Sub_metering_1=
  as.numeric(levels(dsplot3$Sub_metering_1))[dsplot3$Sub_metering_1]

dsplot3$Sub_metering_2=
  as.numeric(levels(dsplot3$Sub_metering_2))[dsplot3$Sub_metering_2]

dsplot3$Sub_metering_3=
  as.numeric(levels(dsplot3$Sub_metering_3))[dsplot3$Sub_metering_3]

plot(dsplot3$Date,dsplot3$Sub_metering_1,col="black",type = 'l',xlab = "",ylab="Energy sub metering")
points(dsplot3$Date,dsplot3$Sub_metering_2,col="red",type = 'l')
points(dsplot3$Date,dsplot3$Sub_metering_3,col="blue",type = 'l')
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png,"plot3.png")
dev.off()