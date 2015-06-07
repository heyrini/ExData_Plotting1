##
###This code reads in power consumption data and plots sub metering values

#Read data and subset to the 2 particular dates
power.data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE)
sub.power.data<-subset(power.data,Date=="1/2/2007"|Date=="2/2/2007")

#convert Date and Time to usable POSIX calendar time format
sub.power.data$Date<-as.Date(sub.power.data$Date, format="%d/%m/%Y")
x<-paste(sub.power.data$Date,sub.power.data$Time)
sub.power.data$Datetime<-strptime(x,format="%Y-%m-%d %H:%M:%S")
sub.power.data$Datetime <- as.POSIXct(sub.power.data$Datetime)

#Plot 
png("plot3.png", width=480, height=480, units="px")
par(mar=c(5,4,1,1))
with(sub.power.data,
     {plot(Sub_metering_1~Datetime,type="l",ylab="Energy Sub Metering")
      lines(Sub_metering_2~Datetime,type="l",col="red")
      lines(Sub_metering_3~Datetime,type="l",col="blue")
      legend("topright",col=c("black","red","blue"),lty=1,legend=colnames(sub.power.data)[7:9])
      })
dev.off()
