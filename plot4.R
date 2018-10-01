##Author:lfer003
#30 Sept 2018
#Coursea Data Science Specialization 4 Exploratory Data Analysis Peer Review Project 1
#Rscipt for Plot 4



#Set the data file variable
data_File <- "./data/household_power_consumption.txt"

#read in the data file into a table uising the read table  function and exclude non values represented as "?"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
#subset the data
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#strip the date and time and combine to make date_time variable
subset_data$date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#set as numeric
subset_data$globalActivePower <- as.numeric(subset_data$Global_active_power)
#set submetering data as numeric
subset_data$subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$subMetering3 <- as.numeric(subset_data$Sub_metering_3)

subset_data$globalReactivePower <- as.numeric(subset_data$Global_reactive_power)
subset_data$voltage <- as.numeric(subset_data$Voltage)

#open png graphics device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#plot the data 1,1
plot(subset_data$date_time, subset_data$globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot the data 2,1
plot(subset_data$date_time, subset_data$voltage, type="l", xlab="datetime", ylab="Voltage")

#plot the data 1,2
plot(subset_data$date_time, subset_data$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subset_data$date_time, subset_data$subMetering2, type="l", col="red")
lines(subset_data$date_time, subset_data$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot the data 2,2
plot(subset_data$date_time, subset_data$globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#turn graphics device off
dev.off()
