
## Create a directory for data sets under the working directory 
if(!file.exists("./data")) {dir.create("./data")}

## Load the zipped data file from the website into the computer
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, 
              destfile = "./data/household_power _consumption_zip", 
              method = "curl")

## Unzipped the zipped data file in the computer
## C:/docs/courseraplus/ExploratoryDataAnalysis/data/exdata_data_household_power_consumption.zip

unzip("./data/household_power _consumption_zip", exdir = "./data")

## Reads in data from the computer, while recoding the missing values to NA

power <- read.table("./data/household_power_consumption.txt",
                    header = TRUE,
                    sep =";",
                    na.strings = "?")

## Subset data to only 2 days of interest
power_2days <- subset(power, Date %in% c("1/2/2007", "2/2/2007"),)

## convert the Date and Time variables to Date/Time classes in R 
## using the strptime() and as.Date() 

power_2days$dt <- paste(power_2days$Date, power_2days$Time)
power_2days$dt <-strptime(power_2days$dt, "%d/%m/%Y %H:%M:%S")

## Make the plot2, saving each plot to PNG file with a width of 480 pixels and a height of 480 pixels.

png("plot2.png", width = 480, height = 480)
plot(power_2days$dt, power_2days$Global_active_power,
     type ="l", 
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
