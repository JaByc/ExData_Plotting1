
data <- read.table(file="./household_power_consumption.txt", dec=".", sep=";", header=T,na.strings = "?")

d1 <- data[which(data$Date == "2/2/2007"),]
d2 <- data[which(data$Date == "1/2/2007"),]

data <- rbind(d2,d1)
myDate <- paste(data$Date, data$Time)
time <- strptime(myDate,"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(
	time,
	as.numeric(data$Global_active_power),
	main = "", xlab="",
	ylab = "Global Active power (kilowatts)",
	type="l",
	yaxt = 'n'
)
axis(side = 2, at = seq(0,3000,1000) ,labels=seq(0,6,2)) 
dev.off()



