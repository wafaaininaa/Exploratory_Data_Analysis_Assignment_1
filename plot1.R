## Data preparation
### Download the data file
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fname = "power_data.zip"
download.file(url,fname)

### Unzip the file
data_file = "household_power_consumption.txt"
unzip(fname, data_file)

### Read the data
Sys.setlocale("LC_TIME","en_US")
df = read.csv(data_file,stringsAsFactors = F,sep = ';')
df$DateTime = strptime(paste(df$Date,df$Time,sep = " ") , "%d/%m/%Y %H:%M:%S")
# Select only measures between 2007-02-01 and 2007-02-02
dfTest = df[(as.Date(df$DateTime) >= as.Date("2007-02-01") & 
               as.Date(df$DateTime) <= as.Date("2007-02-02")),]
dfTest$Weekdays = weekdays(dfTest$DateTime)

## Plot 1
plotName = "plot1.png"
png("plot1.png", width = 480, height = 480)
hist(as.numeric(dfTest$Global_active_power), col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
