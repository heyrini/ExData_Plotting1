###
#This code reads power consumption data file and plots a histogram of Global Active power

#Read text file data and subset
power.data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",
                       as.is=TRUE,na.strings="?")
sub.power.data<-subset(power.data,Date=="1/2/2007"|Date=="2/2/2007")

#Plot
png("plot1.png", width=480, height=480, units="px")
par(mar=c(5,4,1,1))
hist(as.numeric(sub.power.data$Global_active_power),col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
