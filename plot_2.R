#plot 2: this file contained the code for plot from beining.
#using data from the dates "2007-02-01" (date 1) and "2007-02-02" (date 2).
plot2 <-function(date1,date2){
    #get of database
    data <- read.table("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";",
                       na.strings = "?")
    data$Date <-as.Date(data$Date, format="%d/%m/%Y")
    data <- data[(data$Date==date1) | (data$Date==date2),]
    data$Time2<-as.POSIXct(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S" )
    #saved the plot
    png(filename="plot2.png", height=480, width=480, bg="white")
    plot(data$Time2, data$Global_active_power,
         type = "l", 
         col = "black", 
         ylab = "Global Active Power (kilowatts)"
         xlab = "")
    dev.off()
}