#plot 1: this file contained the code for plot from beining.
#using data from the dates "2007-02-01" (date 1) and "2007-02-02" (date 2).
plot1 <-function(date1,date2){
    #get of database
    data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";",
                   na.strings = "?")
    data$Date <-as.Date(data$Date, format="%d/%m/%Y")
    data <- data[(data$Date==date1) | (data$Date==date2),]
    #saved the plot
    png(filename="plot1.png", height=480, width=480, bg="white")
    hist(data$Global_active_power, 
         main = paste("Global Active Power"), 
         col="red", 
         xlab="Global Active Power (kilowatts)")
    dev.off()
}