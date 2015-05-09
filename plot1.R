plot1 <- function(){
  
## read data
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",colClasses=c("character","character",
                 "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## convert date column from character to date
data[,1] <- as.Date(data[,1],"%d/%m/%Y")

## subset data
Usedata<-subset(data, data[,1] >= "2007-02-01" & data[,1] <= "2007-02-02")

## convert time column from character to time
data[,2] <- strptime(data[,2],"%H:%M:%S")

## open pgn
png(file="plot1.png")

## plot histogram
hist(Usedata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power",ylim=c(0,1200))

dev.off()

}