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

#plot 2
y<-paste(x$Date, x$Time, sep = " ");
date_time<-strptime(y, "%Y-%m-%d %H:%M:%S");
new_dataset<-cbind(x, date_time);

par(mar=c(3, 4, 1, 1));
with(new_dataset, plot(date_time,Global_active_power, type="l", ylab="Global Active Power (kilowatts)"));

dev.copy(device = png, filename = 'plot2.png', width = 876, height = 552);
dev.off();