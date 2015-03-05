library(datasets)
#Read file
dt <- read.table ("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = F, na.strings="?")
#Create subset based on date range
dt<- subset(dt, (dt$Date == "1/2/2007" | dt$Date== "2/2/2007"))
#Build plot and create png
hist(dt$Global_active_power, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency")
png("plot1.png", width=480, height= 480)
