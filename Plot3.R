setwd('/C_Programs/R/CourseraExploratoryDataAnalysis')

# read csv2 file
data <- read.csv2('household_power_consumption.txt', 
  comment.char = '', stringsAsFactors = F, na.strings = c('?', ''), 
  nrows = 2075259)
nrow(data) # [1] 2075259
str(data)
# verify that there are NA data
colSums(is.na(data))
# filter the data on the dates of interest
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]
nrow(data) # [1] 2880
# create a datetime vector by concatenating date and time
datetime <- paste(data$Date, data$Time, sep = ' ')
class(datetime) # [1] "character"
# convert datetime to a date/time class
datetime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')
class(datetime) # [1] "POSIXlt" "POSIXt"
# convert Date to a date data type
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
class(data$Date) # [1] "Date"
# convert 'numeric' columns to numeric
data[, 3] <- as.numeric(data[, 3])
data[, 4] <- as.numeric(data[, 4])
data[, 5] <- as.numeric(data[, 5])
data[, 6] <- as.numeric(data[, 6])
data[, 7] <- as.numeric(data[, 7])
data[, 8] <- as.numeric(data[, 8])
data[, 9] <- as.numeric(data[, 9])
head(data)
tail(data)

# there are no NAs in the df of interest
colSums(is.na(data))

# plot 3
plot(datetime, data$Sub_metering_1,
  xlab = '',
  ylab = 'Energy sub metering',
  type = 'n')
axis(labels = c(0, 10, 20, 30)) # 40 does not appear
lines(datetime, data$Sub_metering_1)
lines(datetime, data$Sub_metering_2, col = 'red')
lines(datetime, data$Sub_metering_3, col = 'blue')
legend('topright',
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  lty = c(1, 1, 1),                # bullet symbol
  col = c('black', 'red', 'blue')) # bullet color

# save the plot as a .png file
# width and height are 480 px by default
dev.copy(png, file = 'Plot3.png')
dev.off()