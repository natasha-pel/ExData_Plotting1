
plot3 <- function(){
library(sqldf)
library(lubridate)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")
datetime<- paste(data$Date,data$Time)

plot(dmy_hms(datetime),data$Sub_metering_1, type = "n",ylab="Energy sub metering",xlab="")
points(dmy_hms(datetime),data$Sub_metering_1,type="l")
points(dmy_hms(datetime),data$Sub_metering_2,type="l",col="red")
points(dmy_hms(datetime),data$Sub_metering_3,type="l",col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png",width = 480, height = 480 )
dev.off()
}