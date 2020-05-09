

#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?

library(dplyr)
library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

coal.sources <- SCC[grepl('coal',x=SCC$Short.Name,ignore.case = TRUE),]
coal.combustion.srcs <- NEI %>% filter(SCC %in% coal.sources$SCC) %>%
  group_by(year) %>% summarise(total = sum(Emissions))

png('plot_4.png')

plot_4 <- ggplot(coal.combustion.srcs, aes(year,total)) + geom_line(col='red') + 
  xlab('Year') + ylab('Total Emissions (Tons)') + 
  ggtitle('U.S. PM 2.5 Emissions', subtitle = 'From Coal Combustion Related Sources')

plot(plot_4)
dev.off()
