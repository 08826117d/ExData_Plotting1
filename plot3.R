##read data into R
##detailed comments refer to plot1.R

datafile<-"./ExploreData/household_power_consumption.txt"
alldat<-read.table(datafile,header=TRUE,sep=";",na.strings="?")
usedat<-alldat[alldat$Date%in%c("1/2/2007","2/2/2007"),]
usedat$Date<-as.Date(usedat$Date,format="%d/%m/%Y")
usedat$DateTime<-paste(usedat$Date,as.character(usedat$Time))
usedat$DateTime<-as.POSIXct(usedat$DateTime)

##Create png plot 3
##two variables,thus use plot()
##?plot to see different types, lines is type="l"
png(filename="plot3.png",width=480,height=480,units="px")

#add line 1; note: only the first line can use plot()
##to add 2 and 3 line in the same chart, CANNOT use plot(), use line()
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

##add legend: CANNOT add legend one by one, must use c("","","") to add 
## legend text and col together
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=0.5,
       col=c("black","red","blue")
)

dev.off