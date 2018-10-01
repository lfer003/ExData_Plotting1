##Author:lfer003
#30 Sept 2018
#Coursea Data Science Specialization 4 Exploratory Data Analysis Peer Review Project 1
#Rscipt for Plot 1

#load the data. Remove missing data that is denoted my "?"
data_File <- "./data/household_power_consumption.txt"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

#convert Date field in date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#convert Global _active_powr into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

#Subset the data between 01/02/2007 and 02/02/2007                          
subset_data <- subset(data, Date >= "2007/02/01" & Date <= "2007/02/02")

#Creates the histogram and copies it to png fie
hist(subset_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()


