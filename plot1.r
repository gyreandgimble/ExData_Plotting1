## plot1.r 
## Histogram, Global Active Power (Global_active_power) frequency 

## Set working directory 
setwd("C:/Users/karensanmillan/Documents/Coursera Data Science/4EDA")

## Read in data set from downloaded file 
hpcdata <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      na.strings = "?")

## Convert Date field to date element type  
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")

## Subset to the two days needed: 2007-02-01 and 2007-02-02 
hpcdata2days <- subset(hpcdata, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

##Convert Global Active Power to a numeric measurement 
hpcdata2days$Global_active_power <- as.numeric(as.character(hpcdata2days$Global_active_power))

## Make histogram plot, using base plotting system 
## Assign x axis and title labels as per assignment 
hist(hpcdata2days$Global_active_power, 
     main = paste("Global Active Power"),       
     col="red", 
     xlab="Global Active Power (kilowatts)")

## Save the plot to a PNG file (named plot1.png) with a 
## width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
