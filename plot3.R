library(datasets)
#Read file
dt <- read.table ("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = F, na.strings="?")
#Create subset based on date range
dt<- subset(dt, (dt$Date == "1/2/2007" | dt$Date== "2/2/2007"))

# change the date format
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time))

#Build plot and create png
png("plot3.png", width=480, height= 480)
plot(dt$DateTime, dt$Sub_metering_1, type= "l", ylab= "Energy sub metering", xlab="")
lines(dt$DateTime, dt$Sub_metering_2, type = "l", col = "red")
lines(dt$DateTime, dt$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
