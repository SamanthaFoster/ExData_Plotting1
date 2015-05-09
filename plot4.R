plot4 <- function(){
  
  ## read data
  data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"))
  
  ## convert date column from character to date
  data[,1] <- as.Date(data[,1],"%d/%m/%Y")
  
  ## subset data
  Usedata<-subset(data, data[,1] >= "2007-02-01" & data[,1] <= "2007-02-02")
  
  
  ## open pgn
  png(file="plot4.png")
  
  ## combine the date and time for the x-axis
  x <- paste(Usedata[,1], Usedata[,2]) 
  x<-strptime(x,"%Y-%m-%d %H:%M:%S")
  
  
  
  ## set up grid for plotting
  par(mfrow = c(2,2))
  
  #add plots
  with(Usedata, {
    plot(x,Usedata$Global_active_power,type = "l",ylab = "Global Active Power", xlab = "")
    plot(x,Usedata$Voltage,type = "l",ylab = "Global Active Power", xlab = "datetime")
    plot(x,Usedata$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = "", col = "black")
    par(new=T)
    lines(x,Usedata$Sub_metering_2,type = "l",ylab = "Energy sub metering", xlab = "", col = "red")
    lines(x,Usedata$Sub_metering_3,type = "l",ylab = "Energy sub metering", xlab = "", col = "blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty = 1,cex=0.9, bty="n")
    plot(x,Usedata$Global_reactive_power,type = "l",ylab = "Global_reactive_power", xlab = "datetime")
    })
  
  ## close graphic device
  dev.off()
  
  }