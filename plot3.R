library(data.table)
plot3 <- function ()
  
{


data <- fread("household_power_consumption.txt")


startdate <- as.Date("2007-02-01",format="%Y-%m-%d")
enddate <- as.Date("2007-02-02",format="%Y-%m-%d")

data <- subset(data, (as.Date(data$Date,format="%d/%m/%Y") >= startdate) & (as.Date(data$Date,format="%d/%m/%Y") <= enddate))

##dates<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


plot(x=strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),y=as.numeric(data$Sub_metering_1), type="l", ylab= "Energy sub metering", xlab = "")
lines(x=strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") ,y=as.numeric(data$Sub_metering_2), col="red")
lines(x=strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") ,y=as.numeric(data$Sub_metering_3), col="blue") 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), cex = 0.40)

dev.copy(png, file= "plot3.png")

dev.off()

  }
