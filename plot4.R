library(dplyr)
library(magrittr)

dsplot4<-read.table("household_power_consumption.txt",header = TRUE,sep = ';')

dsplot4$Date=as.Date(dsplot4$Date,"%d/%m/%Y")

dsplot4<-dsplot4%>%
  filter(dsplot4$Date=="2007-02-01" |dsplot4$Date=="2007-02-02" )

dsplot4$Global_active_power=
  as.numeric(levels(dsplot4$Sub_metering_1))[dsplot4$Sub_metering_1]

dsplot4$Sub_metering_1=
  as.numeric(levels(dsplot4$Sub_metering_1))[dsplot4$Sub_metering_1]

dsplot4$Sub_metering_2=
  as.numeric(levels(dsplot4$Sub_metering_2))[dsplot4$Sub_metering_2]

dsplot4$Sub_metering_3=
  as.numeric(levels(dsplot4$Sub_metering_3))[dsplot4$Sub_metering_3]

dsplot4$Voltage=
  as.numeric(levels(dsplot4$Voltage))[dsplot4$Voltage]

dsplot4$Global_reactive_power=
  as.numeric(levels(dsplot4$Global_reactive_power))[dsplot4$Global_reactive_power]

dsplot4$Date=strptime(dsplot4$Date,format = "%Y-%m-%d %H:%M:%S")

dsplot4$Date <- paste(dsplot4$Date, dsplot4$Time)


png("plot4.png",width = 480,height = 480,units = "px")

par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(2,2,2,2))

plot(dsplot4$Date, dsplot4$Global_active_power,type = "l",xlab = "",ylab="Global Active Power(Kilowatts)")


plot(dsplot4$Date, dsplot4$Voltage,type = "l",xlab = "dateTime",ylab="Voltage")


plot(dsplot4$Date,dsplot4$Sub_metering_1,col="black",type = 'l',xlab = "",ylab="Energy sub metering")
points(dsplot4$Date,dsplot4$Sub_metering_2,col="red",type = 'l')
points(dsplot4$Date,dsplot4$Sub_metering_3,col="blue",type = 'l')
legend("topright",bty = "n",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dsplot4$Date, dsplot4$Global_reactive_power,type = "l",xlab = "dateTime",ylab="Global_Reactive_Power")



dev.off()






