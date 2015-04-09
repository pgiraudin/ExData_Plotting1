setwd("~/datascience/04_exploratory")
fileData<-read.csv(file = "household_power_consumption.txt", header = TRUE,sep=";",dec=".", na.strings="?");

#filter by dates
DATE1 <- as.Date("2007-02-01");
DATE2 <- as.Date("2007-02-02");
fileData[,1]<-as.Date(fileData[,1],"%d/%m/%Y");
x<-fileData[fileData$Date >= DATE1 & fileData$Date<= DATE2,];

#remove NA values
x<-na.omit(x);

#plot 1
hist(as.numeric(x$Global_active_power), xlab="Global Active power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power", ylim = c(0,1200), xlim = c(0,6))

dev.copy(device = png, filename = 'plot1.png', width = 876, height = 552);
dev.off();