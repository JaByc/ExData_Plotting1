
data <- read.table(file="./household_power_consumption.txt", dec=".", sep=";", header=T)

d1 <- data[which(data$Date == "2/2/2007"),]
d2 <- data[which(data$Date == "1/2/2007"),]

data <- rbind(d2,d1)

png(filename = "plot1.png", width = 480, height = 480)
hist(
	as.numeric(data$Global_active_power),
	main = "Global Active power",
	xlab = "Global Active power (kilowatts)",
	col = "orangered",
	xlim= c(0,3000),
	breaks = seq(0,6000,250),
	xaxt = 'n'
)
axis(side = 1, at = seq(0,3000,1000),labels=seq(0,6,2)) 
dev.off()



