## plot4.r 
## Four panels, line charts showing: 
## 1: Global Active Power by date 
## 2: Voltage by date 
## 3: Energy sub metering by date 
## 4: Global Reactive Power by date 

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

## Make a 4 panel plot (2 columns, 2 panels in each row) 
par(mfrow = c(2, 2))

## Panel 1: Global Active Power by date 
## (same as plot2, except shorter y axis label) 
## Make line plot, using base plotting system 
## Assign x axis (day of week abbrev) and y axis as per assignment 
## type is l for Line 
plot(hpcdata2days$DateAndTime, hpcdata2days$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

## Panel 2: Voltage by date 
plot(hpcdata2days$DateAndTime, hpcdata2days$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

## Panel 3: Energy sub metering by date  
## (same as plot3)
## Make line plot, using base plotting system 
## Assign x axis (day of week abbrev) and y axis as per assignment 
## type is l for Line 
## First line is black by default 
plot(hpcdata2days$DateAndTime, hpcdata2days$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
## Then add the other two lines, make them red and blue 
lines(hpcdata2days$DateAndTime, hpcdata2days$Sub_metering_2,
      col = "Red")
lines(hpcdata2days$DateAndTime, hpcdata2days$Sub_metering_3, 
      col = "Blue")
## Add the legend in the top right corner, for each of the three lines 
legend("topright", 
       lty = 1, 
       bty="n",  ##no box around legend
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.75) ##had to shrink the font a bit to get all the legend text to fit

## Panel 4: Global reactive power by date 
plot(hpcdata2days$DateAndTime, hpcdata2days$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

## Save the plot to a PNG file (named plot4.png) with a 
## width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
