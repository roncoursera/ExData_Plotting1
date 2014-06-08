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
png("plot2.png",width=480, height=480, bg="transparent")
plot(dt,powdat[,3],type='l',
    ylab="Global Active Power (kilowatts)",
    xlab="")
dev.off()


