setwd("~/datascience/04_exploratory")
Sys.setlocale("LC_ALL","C")
fileData<-read.csv(file = "household_power_consumption.txt", header = TRUE,sep=";",dec=".", na.strings="?");

#filter by dates
DATE1 <- as.Date("2007-02-01");
DATE2 <- as.Date("2007-02-02");
fileData[,1]<-as.Date(fileData[,1],"%d/%m/%Y");
x<-fileData[fileData$Date >= DATE1 & fileData$Date<= DATE2,];

#remove NA values
x<-na.omit(x);

#create date time column
y<-paste(x$Date, x$Time, sep = " ");
date_time<-strptime(y, "%Y-%m-%d %H:%M:%S");
new_dataset<-cbind(x, date_time);

#plot3
par(mar=c(3, 4, 1, 1));
with(new_dataset, plot(date_time,Sub_metering_1, type="l", ylab="Energy sub metering"))
with(new_dataset, lines(date_time,Sub_metering_2, col ="red"))
with(new_dataset, lines(date_time,Sub_metering_3, col ="blue"))
legend("topright", lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(device = png, filename = 'plot3.png', width = 876, height = 552);
dev.off();