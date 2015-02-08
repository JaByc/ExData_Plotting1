
data <- read.table(file="./household_power_consumption.txt", dec=".", sep=";", header=T,na.strings = "?")

d1 <- data[which(data$Date == "2/2/2007"),]
d2 <- data[which(data$Date == "1/2/2007"),]

data <- rbind(d2,d1)
myDate <- paste(data$Date, data$Time)
time <- strptime(myDate,"%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
### 1 ###
plot(
	time,
	as.numeric(data$Global_active_power),
	main = "", xlab="",
	ylab = "Global Active power (kilowatts)",
	type="l",
	yaxt = 'n'
)
axis(side = 2, at = seq(0,3000,1000) ,labels=seq(0,6,2)) 
### 2 ###
plot(   
	time,
	as.numeric(data$Voltage),
	xlab = "datetime",
	ylab = "Voltage",
	type="l",
	yaxt ='n'

)
axis(side = 2, at = seq(234,246,2),labels=c("234", "" ,"238", "" ,"242" , "" ,"246"))
### 3 ###
plot(
	time,
	as.numeric(data$Sub_metering_1),
	main = "", xlab="",
	ylab = "Energy sub metering",
	type="l",
	col="black"
)
lines(
	time,
	as.numeric(data$Sub_metering_2),
	col="orangered"
)
lines(
	time,
	as.numeric(data$Sub_metering_3),
	col="blue"
)

legend(
	"topright", 
	lty=c(1,1,1),
	col = c(
		"black",
		"orangered",
		"blue"
	),
	legend = c(
		"Sub_metering_1",
		"Sub_metering_2",
		"Sub_metering_3"
	),
	bty='n'
)
### 4 ###
plot(
	time,
	data$Global_reactive_power,
	main = "", xlab="datetime",
	ylab = "Global_reactive_power",
	type="l",
	col="black"
)
dev.off()



