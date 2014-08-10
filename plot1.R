##read data into R; note: specify the na.strings format
datafile<-"./ExploreData/household_power_consumption.txt"
alldat<-read.table(datafile,header=TRUE,sep=";",na.strings="?")

##get data for 2007-02-01 and 2007-02-02
##note: cannot use alldat$date==c("01/02/2007","02/02/2007"),since== can only lead to one value
##therefore need to use dat2<-dat[dat$col%in%c("A","B"),] (there is a comma!)
usedat<-alldat[alldat$Date%in%c("1/2/2007","2/2/2007"),]

##clarify what is x-axis: it is date+time, thus use paste()
usedat$Date<-as.Date(usedat$Date,format="%d/%m/%Y")
usedat$DateTime<-paste(usedat$Date,as.character(usedat$Time))

##use POSIXct to change the new column to time format
usedat$DateTime<-as.POSIXct(usedat$DateTime)
##check column format:
##class(usedat$DateTime)  [1] "POSIXct" "POSIXt" should be correct

##Create png plot1 and set the size
##plot, this is only 1 variable, thus use Hist
png(filename="plot1.png",width=480,height=480,units="px")
hist(usedat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
