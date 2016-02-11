# Read in table to Data Frame (from 1/2/2007 to 2/2/2007)
filename = 'household_power_consumption.txt'
data <- read.table(filename,skip=66637,nrows=2880,sep=';',
                   stringsAsFactors=FALSE,na.strings='?')

# Name columns in Data Frame
names(data) <- c('Date','Time','GAP','GRP','V','GI','SM1','SM2','SM3')

# Convert columns to numeric data type
data$GAP <- as.numeric(data$GAP)
data$V <- as.numeric(data$V)
data$GRP <- as.numeric(data$GRP)
data$SM1 <- as.numeric(data$SM1)
data$SM2 <- as.numeric(data$SM2)
data$SM3 <- as.numeric(data$SM3)

# Convert date and time strings to datetime object
data$Datetime <- paste(data$Date,data$Time,sep=' ')
data$Datetime <- strptime(data$Datetime,'%d/%m/%Y %H:%M:%S')

# Setup png device for plotting
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))

# Perform plotting
plot(data$Datetime,data$GAP,type= "l",ylab="Global Active Power")

plot(data$Datetime,data$V,type='l',xlab='datetime',ylab='Voltage')

plot(data$Datetime,data$SM1,type='l',ylab='Energy sub metering')
lines(data$Datetime,data$SM2,type='l',col='red')
lines(data$Datetime,data$SM3,type='l',col='blue')

legendLabels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend('topright',legendLabels,lty=1,col=c('black','red','blue'))

plot(data$Datetime,data$GRP,type='l',xlab='datetime',
     ylab='Global_reactive_power')

dev.off()
