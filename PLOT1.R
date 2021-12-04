myfile <- "exdata-data-NEI_data.zip"

if (!file.exists(myfile)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileUrl, destfile = myfile)
  unzip (zipfile = myfile)
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#making the plot
png("plot1.png",width=460,height=460,units="px",type = "cairo")
total_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
with(total_emissions,
     barplot(height=Emissions/1000, names.arg = year, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
dev.off()