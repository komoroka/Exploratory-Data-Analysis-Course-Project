
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base plotting system to make 
#a plot answering this question.

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

baltimore.data <- subset(NEI, fips == '24510')

yrs1 <- split(baltimore.data, factor(baltimore.data$year))
baltimore.emissions <- unlist(lapply(yrs1, function(x) sum(x$Emissions, na.rm = TRUE)))

png('plot_2.png')
plot(as.Date(names(baltimore.emissions),'%Y'), baltimore.emissions, pch = 19, 
     xlab = 'Years', ylab = 'Total Emissions (Tons)', main = 'Total PM 2.5 Emissions in Baltimore By Year')
seg <- data.frame(names(baltimore.emissions)[1:3], names(baltimore.emissions)[2:4])

segments(as.Date(names(baltimore.emissions)[1:3],'%Y'), baltimore.emissions[1:3],
         as.Date(names(baltimore.emissions)[2:4],'%Y'), baltimore.emissions[2:4])

dev.off()