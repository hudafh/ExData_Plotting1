plot2 <- function(){
  
  energy_data <- read.table("c:/users/hugo.m.barros/videos/Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt",sep = ";")
  
  lines<- grep("^(1|2)/2/2007$",energy_data[,"V1"])
  
  feb2007 <- energy_data[lines,]
  
  measures <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  colnames(feb2007) <- measures
  
  date_day <- as.character(feb2007$Date)
  date_time <- as.character(feb2007$Time)
  
  full_date <- paste(date_day, date_time)
  
  full_date <- as.POSIXct(full_date, format = '%d/%m/%Y %H:%M:%S')
  
  plot(full_date, as.numeric(as.character(feb2007$Global_active_power)), type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
  
  

  dev.copy(png, file = "C:/Users/hugo.m.barros/Videos/Data Science/Exploratory Data Analysis/Course Project 1/plot2.png") 
  dev.off()
  
  
}