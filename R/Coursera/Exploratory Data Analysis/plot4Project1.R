
## reading the data
hpc<-read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors=FALSE)
hpc_new<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]


##Open png device and create file plot4.png in my working directory 
png(file="plot4.png",width = 480, height = 480)


##now let's make plot3, but first set the class of the data
datetime<-as.POSIXct(paste(hpc_new$Date,hpc_new$Time),format="%d/%m/%Y %H:%M:%S")
h<-as.numeric(paste(hpc_new$Global_active_power))
v<-as.numeric(paste(hpc_new$Voltage))
r<-as.numeric(paste(hpc_new$Global_reactive_power))

sm1<-as.numeric(paste(hpc_new$Sub_metering_1))
sm2<-as.numeric(paste(hpc_new$Sub_metering_2))
sm3<-as.numeric(paste(hpc_new$Sub_metering_3))

##Set parameters
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

##First plot
plot(datetime,h,type="l",xlab="",ylab = "Global Active Power")

##Second plot
plot(datetime,v,type="l",ylab = "Voltage")

##Third plot
plot(datetime,sm1,type="n",xlab = "",ylab = "Energy sub metering")
lines(datetime,sm1)
lines(datetime,sm2,col="red")
lines(datetime,sm3,col="blue")
legend("topright",
       lty = c(1,1,1),
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n"
       )

##Fourth plot
plot(datetime,r,type="l",ylab = "Global_reactive_power")

##Close png file device
dev.off()
