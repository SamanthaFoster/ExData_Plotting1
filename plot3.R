plot3 <- function(){
  
  ## read data
  data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"))
  
  ## convert date column from character to date
  data[,1] <- as.Date(data[,1],"%d/%m/%Y")
  
  ## subset data
  Usedata<-subset(data, data[,1] >= "2007-02-01" & data[,1] <= "2007-02-02")
  
  
  ## open pgn
  png(file="plot3.png")
  
  ## combine the date and time for the x-axis
  x <- paste(Usedata[,1], Usedata[,2]) 
  x<-strptime(x,"%Y-%m-%d %H:%M:%S")
  
  ## set the y-axes to the different sub metering stations
  y1 <- Usedata$Sub_metering_1
  y2 <- Usedata$Sub_metering_2
  y3 <- Usedata$Sub_metering_3
  
  ## plot 
{
  plot(x,y1,type = "l",ylab = "Energy sub metering", xlab = "", col = "black")
  par(new=T)
  lines(x,y2,type = "l",ylab = "Energy sub metering", xlab = "", col = "red")
  lines(x,y3,type = "l",ylab = "Energy sub metering", xlab = "", col = "blue")
}
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)
  
  dev.off()
}