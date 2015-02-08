## jvlaming 2015-2-7 for Coursera - Exploratory Data Analysis - Course Project 1

# Objective: duplicate plot 2
# Usage: 
# 1) copy this R script to your R working directory, 
# 2) copy the source data file "household_power_consumption.txt" to the same working directory, 
# 3) source and run the script. The resulting png file will be placed in your working directory.

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
png(file = "plot2.png", width=480, height=480)

# create plot 2
plot(epc$Time, epc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# close device
dev.off()
