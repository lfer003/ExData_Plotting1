##Author:lfer003
#30 Sept 2018
#Coursea Data Science Specialization 4 Exploratory Data Analysis Peer Review Project 1
#Rscipt for Plot 3

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

#open png graphics device
png("plot3.png", width=480, height=480)
#plot the data
plot(subset_data$date_time, subset_data$subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(subset_data$date_time, subset_data$subMetering2, type="l", col="red")
lines(subset_data$date_time, subset_data$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#turn graphics device off
dev.off()
