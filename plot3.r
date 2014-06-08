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
png("plot3.png",width=400, height=400, bg="transparent")
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
    col=col) 
dev.off()


