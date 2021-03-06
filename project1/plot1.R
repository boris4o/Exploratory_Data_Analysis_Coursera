# import the dataset
data_full <- read.csv("C:\\Users\\310186913\\Desktop\\project1\\household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
#format the date
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# create subsets
df <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## convert dates dates
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
