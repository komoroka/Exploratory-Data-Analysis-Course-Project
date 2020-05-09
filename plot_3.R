
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999–2008 
#for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the 
#ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

baltimore.pollution.by.type <- NEI %>% filter(fips=='24510') %>% 
  group_by(type, year) %>% summarise(total = sum(Emissions))

png('plot_3.png')

plot_3 <- ggplot(baltimore.pollution.by.type, aes(year, total, col=type)) + 
  geom_line() + xlab('Year') + ylab('Total Emissions (Tons)') + 
  ggtitle('Baltimore PM 2.5 Emission By Type and Year')

plot(plot_3)

dev.off()