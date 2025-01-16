# Code for importing remote sensing data from outside R

library(terra)

# Setting the working directory
setwd("~/Downloads")

# Windowds: "C:\\path\Downloads" -> "C://path/Downloads"

getwd()

cal <- rast("altadenaeatonwide_aviris_20250111_lrg.jpg")
plot(cal)

# Analysing he uploaded data
# Original coord: 0, 1440, 0, 600  (xmin, xmax, ymin, ymax)
ext <- c(100, 1000, 100, 500)
calcrop <- crop(cal, ext)
plot(calcrop)

# Exporting data
writeRaster(calcrop, "calcrop.png")

# Exercise: download a set of the Earth Observatory and upload it in R
sun <- rast("Sun_STEREO_4dec2006_lrg.jpg")
sun
plot(sun)

# extent      : 0, 1800, 0, 1800  (xmin, xmax, ymin, ymax)
# cropping the data
ext <- c(100, 1000, 100, 1000)
suncrop <- crop(sun, ext)
plot(suncrop)

writeRaster(suncrop, "suncrop.png")


