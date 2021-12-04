baltimoreNEI <- subset(NEI, fips == "24510")
png("plot3.png",width=460,height=460,units="px",type = "cairo")
total_emissions <- aggregate(Emissions ~ year, baltimoreNEI, FUN = sum)
library(ggplot2)
g_plot <- ggplot(baltimoreNEI, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Source Type")
print(g_plot)
dev.off()