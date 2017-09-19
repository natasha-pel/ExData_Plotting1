plot2 <- function(){
library(sqldf)
library(lubridate)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")

datetime<- paste(data$Date,data$Time)
plot(dmy_hms(datetime),data$Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()
}