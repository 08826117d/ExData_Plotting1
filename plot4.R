##read data into R
##detailed comments refer to plot1.R

datafile<-"./ExploreData/household_power_consumption.txt"
alldat<-read.table(datafile,header=TRUE,sep=";",na.strings="?")
usedat<-alldat[alldat$Date%in%c("1/2/2007","2/2/2007"),]
usedat$Date<-as.Date(usedat$Date,format="%d/%m/%Y")
usedat$DateTime<-paste(usedat$Date,as.character(usedat$Time))
usedat$DateTime<-as.POSIXct(usedat$DateTime)

##create plot4
##the layout is 2*2, thus use par(mfrow) to set layout
png(filename="plot4.png",
    width=480,
    height=480,
    units="px")

par(mfrow=c(2,2))
##the sequence is topleft,topright,bottomleft,bottomright

plot(x=usedat$DateTime,
     y=usedat$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(x=usedat$DateTime,
     y=usedat$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(x=usedat$DateTime,
     y=usedat$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

##add line 2
lines(x=usedat$DateTime,
      y=usedat$Sub_metering_2,
      type="l",
      col="red",  
      xlab="")

##add line 3
lines(x=usedat$DateTime,
      y=usedat$Sub_metering_3,
      type="l",
      col="blue",  
      xlab="")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=0.5,
       col=c("black","red","blue")
)


plot(x=usedat$DateTime,
     y=usedat$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
