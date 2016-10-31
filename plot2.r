## plot2.r 
## Line chart, Global Active Power (Global_active_power) by date/time  

## Set working directory 
setwd("C:/Users/karensanmillan/Documents/Coursera Data Science/4EDA")

## Read in data set from downloaded file 
hpcdata <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      na.strings = "?")

## Subset to the two days needed: 2007-02-01 and 2007-02-02 
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")
hpcdata2days <- subset(hpcdata, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

## Convert Date and Time fields to a single Date/Time element (class)
## using the strptime() function 
hpcdata2days$DateAndTime <- strptime(paste(hpcdata2days$Date, hpcdata2days$Time), "%Y-%m-%d %H:%M:%S")

##Convert Global Active Power to a numeric measurement 
hpcdata2days$Global_active_power <- as.numeric(as.character(hpcdata2days$Global_active_power))

## Make line plot, using base plotting system 
## Assign x axis (day of week abbrev) and y axis as per assignment 
## type is l for Line 
plot(hpcdata2days$DateAndTime, hpcdata2days$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

## Save the plot to a PNG file (named plot2.png) with a 
## width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
