

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

vehicle.sources <- SCC[grepl('vehicle',x=SCC$Short.Name,ignore.case = TRUE),]

baltimore.vehicle.data <- baltimore.data %>% filter(SCC %in% vehicle.sources$SCC) %>%
  group_by(year) %>% summarise(total = sum(Emissions))

png('plot_5.png')

plot_5 <- ggplot(baltimore.vehicle.data, aes(year, total)) + geom_line(col='blue') +
  ylab('Total Emissions (Tons)') + xlab('Year') + 
  ggtitle('Total Vehicle PM 2.5 Emissions in Baltimore by Year')

plot(plot_5) 
dev.off() 