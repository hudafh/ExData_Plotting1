plot4 <- function(){
  
  energy_data <- read.table("c:/users/hugo.m.barros/videos/Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt",sep = ";")
  
  lines<- grep("^(1|2)/2/2007$",energy_data[,"V1"])
  
  feb2007 <- energy_data[lines,]
  
  measures <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  colnames(feb2007) <- measures
  
  date_day <- as.character(feb2007$Date)
  date_time <- as.character(feb2007$Time)
  
  full_date <- paste(date_day, date_time)
  
  full_date <- as.POSIXct(full_date, format = '%d/%m/%Y %H:%M:%S')
  
  png(file = "C:/Users/hugo.m.barros/Videos/Data Science/Exploratory Data Analysis/Course Project 1/plot4.png") 
  
  par(mfrow = c(2,2), mar = c(5.1,4.1,4.1,2.1), oma = c(0,0,0,0))
  
  
  plot(days, as.numeric(as.character(feb2007$Global_active_power)), type = "l", ylab = "Global Active Power", xlab = "") 
  plot(days,as.numeric(as.character(feb2007$Voltage)),type = "l", xlab = "datetime", ylab = "Voltage") 
  
  plot(days,as.numeric(as.character(feb2007$Sub_metering_1)),type = "l", xlab = "", ylab = "Energy sub metering")
  points(days, as.numeric(as.character(feb2007$Sub_metering_2)), type = "l", col ="red")
  points(days, as.numeric(as.character(feb2007$Sub_metering_3)), type = "l", col ="blue")
  legend("topright", lty = c(1,1,1), col = c("black", "red","blue") , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  
  plot(days, as.numeric(as.character(feb2007$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
 
  
  dev.off()
}