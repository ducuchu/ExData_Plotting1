#plot 4: this file contained the code for plot from beining.
#using data from the dates "2007-02-01" (date 1) and "2007-02-02" (date 2).
plot4 <-function(date1,date2){
    #get of database
    data <- read.table("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";",
                       na.strings = "?")
    data$Date <-as.Date(data$Date, format="%d/%m/%Y")
    data <- data[(data$Date==date1) | (data$Date==date2),]
    data$Time2<-as.POSIXct(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S" )
    #saved the plot
    png(filename="plot4.png", height=480, width=480, bg="white")
    par(mfrow=c(2,2))
    #plot1
    plot(data$Time2, data$Global_active_power,
         type = "l", 
         col = "black", 
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    #plot2
    plot(data$Time2, data$Voltage,
         type = "l", 
         col = "black", 
         ylab = "Voltage",
         xlab = "datatime")
    #plot3
    plot(data$Time2, data$Sub_metering_1,
                    type = "l", 
                    col = "black", 
                    ylab = "Energy sub metering",
                    xlab = "")
    lines(data$Time2, data$Sub_metering_2,
          col = "red")
    lines(data$Time2, data$Sub_metering_3,
          col = "blue")
    legend("topright", lty =1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #plot4
    plot(data$Time2, data$Global_reactive_power,
         type = "l", 
         col = "black", 
         ylab = "Global_reactive_power",
         xlab = "datatime")
    dev.off()
}