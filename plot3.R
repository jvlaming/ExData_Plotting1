## jvlaming 2015-2-7 for Coursera - Exploratory Data Analysis - Course Project 1

# Objective: duplicate plot 3

# read all data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# subset two specific dates
epc <-df[df$Date == "1/2/2007" | df$Date == "2/2/2007",] 
# remove full set from memory
rm(df)
# convert time string to time, incl correct date
epc$Time <- strptime(paste(epc$Date,epc$Time), "%d/%m/%Y %T")
# convert date string to date
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")


# open png device
png(file = "plot3.png", width=480, height=480)

#plot3
with(epc, plot(Time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(epc, lines(Time, Sub_metering_2, type="l", col="red"))
with(epc, lines(Time, Sub_metering_3, type="l", col="blue"))
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black','red','blue'), xjust=0)

# close device
dev.off()
