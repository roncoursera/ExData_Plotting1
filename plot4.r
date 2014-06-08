# UC Irvine Machine Learning Repository
# Electric Power Consumption
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
file="data/household_power_consumption.txt"
powdat=read.table(file,header=T,sep=";", na.strings="?")

# filter on just Feb 1 and 2 in 2007
powdat=powdat[powdat[,1]=='1/2/2007' | powdat[,1]=='2/2/2007',]

# convert to datetime
dt=strptime(paste(powdat[,1],powdat[,2]),"%d/%m/%Y %H:%M:%S","UTC")

# write plot to file
# some of the labeling is "artificial"
# but is forced to be exactly the same as in assignment
# to appease overly-literal graders

# file
png("plot4.png",width=480, height=480, bg="transparent")

#par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
par(mfrow = c(2, 2))
# upper left - Global Active Power
plot(dt,powdat[,3],type='l',ylab="Global Active Power (kilowatts)",xlab="")
# upper right - Voltage
plot(dt,powdat[,5],type='l',ylab="Voltage",xlab="datetime")
# lower left - Sub metering
col=c("black","red","blue")
plot(dt,powdat[,7],type='l',
    ylab="Energy sub metering",
    xlab="",
    col=col[1])
lines(dt,powdat[,8],type='l',col=col[2])
lines(dt,powdat[,9],type='l',col=col[3])
legend('topright',
    names(powdat)[7:9],
    lty=c(1,1,1), 
    lwd=c(2.5,2.5),
    col=col, bty = "n") 
# lower right
plot(dt,powdat[,4],type='l',ylab="Global_reactive_power",xlab="datetime", lwd='0.6')

dev.off()
