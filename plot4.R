
plot4 <- function(){
library(sqldf)
library(lubridate)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")
datetime<- paste(data$Date,data$Time)

png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(dmy_hms(datetime),data$Global_active_power,type="l",xlab = "", ylab = "Global Active Power") 
plot(dmy_hms(datetime),data$Voltage,type="l",xlab = "datetime", ylab = "Voltage") 


plot(dmy_hms(datetime),data$Sub_metering_1, type = "n",ylab="Energy sub metering",xlab="")
points(dmy_hms(datetime),data$Sub_metering_1,type="l")
points(dmy_hms(datetime),data$Sub_metering_2,type="l",col="red")
points(dmy_hms(datetime),data$Sub_metering_3,type="l",col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")


plot(dmy_hms(datetime),data$Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power") 
dev.off()

}