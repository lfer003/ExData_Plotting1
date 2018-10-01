##Author:lfer003
#30 Sept 2018
#Coursea Data Science Specialization 4 Exploratory Data Analysis Peer Review Project 1
#Rscipt for Plot 2

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
#open png graphics device
png("plot2.png", width=480, height=480)
#plot the data
plot(subset_data$date_time, subset_data$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#turn graphics device off
dev.off()