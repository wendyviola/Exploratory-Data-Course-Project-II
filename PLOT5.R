vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]
baltimoreVehiclesNEI <- vehicles_NEI[vehicles_NEI$fips=="24510",]

png("plot5.png",width=460,height=460,units="px",type = "cairo")

g_plot <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.5) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  ggtitle("Baltimore Vehicle Emissions, 1999 to 2008.")

print(g_plot)

dev.off()
