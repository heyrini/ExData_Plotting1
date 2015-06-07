##
#This code reads in power consumption data and plots a time-series like plot for Global Active power for Feb1 and Feb2 2007

#Read data and subset to the 2 particular dates
power.data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE)
sub.power.data<-subset(power.data,Date=="1/2/2007"|Date=="2/2/2007")

#convert Date and Time to usable POSIX calendar time format
sub.power.data$Date<-as.Date(sub.power.data$Date, format="%d/%m/%Y")
x<-paste(sub.power.data$Date,sub.power.data$Time)
sub.power.data$Datetime<-strptime(x,format="%Y-%m-%d %H:%M:%S")
sub.power.data$Datetime <- as.POSIXct(sub.power.data$Datetime)

#Plot 
png("plot2.png", width=480, height=480, units="px")
par(mar=c(5,4,1,1))
with(sub.power.data,
     plot(Global_active_power~Datetime,
     type="l",
     ylab="GLobal Active Power (kilowatts)"
     ,xlab=""))
dev.off()

