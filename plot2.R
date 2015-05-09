plot2 <- function(){
  
## read data
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",
                 colClasses=c("character","character","numeric","numeric","numeric",
                              "numeric","numeric","numeric","numeric"))

## convert date column from character to date
data[,1] <- as.Date(data[,1],"%d/%m/%Y")

## subset data
Usedata<-subset(data, data[,1] >= "2007-02-01" & data[,1] <= "2007-02-02")


## open pgn
png(file="plot2.png")

## combine the date and time for the x-axis
x <- paste(Usedata[,1], Usedata[,2]) 
x<-strptime(x,"%Y-%m-%d %H:%M:%S")

## set the y-axis to Global Active Power
y <- Usedata$Global_active_power  

## plot 
plot(x,y,type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
}