plot1 <- function(){
library(sqldf)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")

hist(data$Global_active_power,col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
}