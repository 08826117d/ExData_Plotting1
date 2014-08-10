##read data into R
##detailed comments refer to plot1.R

datafile<-"./ExploreData/household_power_consumption.txt"
alldat<-read.table(datafile,header=TRUE,sep=";",na.strings="?")
usedat<-alldat[alldat$Date%in%c("1/2/2007","2/2/2007"),]
usedat$Date<-as.Date(usedat$Date,format="%d/%m/%Y")
usedat$DateTime<-paste(usedat$Date,as.character(usedat$Time))
usedat$DateTime<-as.POSIXct(usedat$DateTime)


##Create png plot 2
##two variables,thus use plot()
##?plot to see different types, lines is type="l"
png(filename="plot2.png",width=480,height=480,units="px")
plot(x=usedat$DateTime,
     y=usedat$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)")

dev.off()

