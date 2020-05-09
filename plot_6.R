#Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

combined.vehicle.data <- NEI %>% 
  filter(fips %in% c('24510','06037'), type=='ON-ROAD') %>% 
  mutate(City = ifelse(fips=='24510','Baltimore','Los Angeles')) %>%
  group_by(City, year) %>% summarise(total = sum(Emissions))

png('plot_6.png')
plot_6 <- ggplot(combined.vehicle.data, aes(x = year, y = total, col = City)) + 
  geom_line() + ylab('Total Emission (Tons)') + xlab('Year') + 
  ggtitle('PM 2.5 Vehicle Emissions By Year', subtitle = 'Baltimore and Los Angeles')

plot(plot_6)
dev.off()

