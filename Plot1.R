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

# plot 1
hist(data$Global_active_power,
  xlab = 'Global Active Power (kilowatts)',
  main = 'Global Active Power',
  col = 'red')

# save the plot as a .png file
# width and height are 480 px by default
dev.copy(png, file = 'Plot1.png')
dev.off()
