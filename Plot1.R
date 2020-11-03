getwd()
setwd("F:/Library/R Programing/exploratory data analysis")
ls()
#downloding data and reading data
dir.create("data")
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="./data/epc.zip")
setwd("F:/Library/R Programing/exploratory data analysis/data")
unzip(zipfile="epc.zip")
hpcData<-read.table("./household_power_consumption.txt",skip=1,sep=";",header=FALSE)
names(hpcData)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
str(hpcData)
#subsetting data on for two dates
subsetdata<- subset(hpcData,hpcData$Date=="1/2/2007"|hpcData$Date=="2/2/2007")
str(subsetdata)
subsetdata$Global_active_power<-as.numeric(subsetdata$Global_active_power)
summary(subsetdata$Global_active_power)

#drawing graph: plot1
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()