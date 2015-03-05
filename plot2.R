library(datasets)
#Read file
dt <- read.table ("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = F, na.strings="?")
#Create subset based on date range
dt<- subset(dt, (dt$Date == "1/2/2007" | dt$Date== "2/2/2007"))

# change the date format
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time))

#Build plot and create png
png("plot2.png", width=480, height= 480)
plot(dt$DateTime, dt$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
