
  
  
> file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
> dir.create("/Users/zeej12/Documents/Exploratory Data Analysis")
> setwd("/Users/zeej12/Documents/Exploratory Data Analysis")
> download.file(file.url,destfile = "/Users/zeej12/Documents/Exploratory Data Analysis/Dataset")
> unzip("Dataset", exdir = "Exploratory Data Analysis", overwrite = TRUE)
> xclass <- c(rep("character", 2), rep("numeric", 7)) 
> consumptionofpower <- read.table("Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = xclass)
> columns <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
> columns <- colnames(consumptionofpower)
> install.packages("lubridate")
> require("lubridate")  
> consumptionofpower$DateTime <-dmy(consumptionofpower$Date) +hms(consumptionofpower$Time)
> consumptionofpower <- consumptionofpower[, c(10, 3:9)]
> write.table(consumptionofpower, file = "Exploratory Data Analysis/power_consumption.txt", sep = "|", row.names = FALSE)  