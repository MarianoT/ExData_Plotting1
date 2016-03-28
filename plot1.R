library(data.table)
plot1 <- function ()
  
{
  
 
data <- fread("household_power_consumption.txt")


startdate <- as.Date("2007-02-01",format="%Y-%m-%d")
enddate <- as.Date("2007-02-02",format="%Y-%m-%d")

data <- subset(data, (as.Date(data$Date,format="%d/%m/%Y") >= startdate) & (as.Date(data$Date,format="%d/%m/%Y") <= enddate))

##dates<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


hist(as.numeric(data$Global_active_power), col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")  
dev.copy(png, file= "plot1.png")

dev.off()

}

