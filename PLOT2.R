baltimoreNEI <- subset(NEI, fips == "24510")
#making the plot
png("plot2.png",width=460,height=460,units="px",type = "cairo")
total_emissions <- aggregate(Emissions ~ year, baltimoreNEI, FUN = sum)
with(total_emissions,
     barplot(height=Emissions/1000, names.arg = year, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008')))
dev.off()