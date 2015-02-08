
data <- read.table(file="./household_power_consumption.txt", dec=".", sep=";", header=T,na.strings = "?")

d1 <- data[which(data$Date == "2/2/2007"),]
d2 <- data[which(data$Date == "1/2/2007"),]

data <- rbind(d2,d1)
myDate <- paste(data$Date, data$Time)
time <- strptime(myDate,"%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
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
	)
)


dev.off()



