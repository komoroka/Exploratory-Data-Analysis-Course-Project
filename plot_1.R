# download and unzip the data (only done for the first plot)
filename <- 'Data for Peer Assessment.zip'
download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip',
              destfile = filename)

unzip(filename)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

yrs  <- split(NEI, factor(NEI$year))

total.emissions <- unlist(lapply(yrs, function(x) sum(x$Emissions, na.rm = TRUE)))

png('plot_1.png')

plot(as.Date(names(total.emissions),'%Y'), total.emissions, pch = 19, 
     xlab = 'Years', ylab = 'Total Emissions (Tons)', main = 'Total U.S. PM 2.5 Emissions By Year')
seg <- data.frame(names(total.emissions)[1:3], names(total.emissions)[2:4])

segments(as.Date(names(total.emissions)[1:3],'%Y'), total.emissions[1:3],
         as.Date(names(total.emissions)[2:4],'%Y'), total.emissions[2:4])

dev.off()