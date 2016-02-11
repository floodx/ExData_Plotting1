# Read in table to Data Frame (from 1/2/2007 to 2/2/2007)
filename = 'household_power_consumption.txt'
data <- read.table(filename,skip=66637,nrows=2880,sep=';',
                   stringsAsFactors=FALSE,na.strings='?')

# Name columns in Data Frame
names(data) <- c('Date','Time','GAP','GRP','V','GI','SM1','SM2','SM3')

# Convert column to numeric data type
data$GAP <- as.numeric(data$GAP)

# Convert date and time strings to datetime object
data$Datetime <- paste(data$Date,data$Time,sep=' ')
data$Datetime <- strptime(data$Datetime,'%d/%m/%Y %H:%M:%S')

# Setup png device for plotting
png('plot2.png',width=480,height=480)

# Perform plotting
plot(data$Datetime,data$GAP,type='l',xlab="",
     ylab='Global Active Power (kilowatts)')
dev.off()