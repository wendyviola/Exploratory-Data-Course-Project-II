vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

BaltimorevehiclesNEI <- vehicles_NEI[vehicles_NEI$fips=="24510",]
BaltimorevehiclesNEI$city <- "Baltimore City"
LosvehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
LosvehiclesNEI$city <- "Los Angeles County"

V_emissions <- rbind(BaltimorevehiclesNEI, LosvehiclesNEI)

png("plot6.png",width=460,height=460,units="px",type = "cairo")
g_plot <- ggplot(V_emissions, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) +
  ggtitle("Los Angeles vs Baltimore Vehicle Emissions")

print(g_plot)
dev.off()