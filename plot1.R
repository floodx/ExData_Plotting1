# Read in table to Data Frame (from 1/2/2007 to 2/2/2007)
filename = 'household_power_consumption.txt'
data <- read.table(filename,skip=66637,nrows=2880,sep=';',
                   stringsAsFactors=FALSE,na.strings='?')

# Name columns in Data Frame
names(data) <- c('Date','Time','GAP','GRP','V','GI','SM1','SM2','SM3')

# Convert column to numeric data type
data$GAP <- as.numeric(data$GAP)

# Setup png device for plotting
png('plot1.png',width=480,height=480)

# Perform plotting
hist(data$GAP,col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)',ylab='Frequecy')
dev.off()
