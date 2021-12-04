library(dplyr)
coal_SCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
coal_NEI <- NEI %>% filter(SCC %in% coal_SCC)
coal_summary <- coal_NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

png("plot4.png",width=460,height=460,units="px",type = "cairo")

g_plot <- ggplot(coal_summary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  geom_bar(stat="identity",fill="grey",width=2) + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Coal Combustion Emissions, 1999 to 2008.")
print(g_plot)
dev.off()
