# R code for visualizing satellite data

# Packages needed
install.packages("terra")
install.packages("devtools")
install.packages("viridis")

library(viridis)
library(terra)
library(devtools)
# devtools related function to install packages from GItHub:
install_github("ducciorocchini/imageRy")

# Once imageRy has been installed by the devtools package, we can recall it by:
library(imageRy)

# Listing data
im.list()

# Using Sentinel-2 bands
# Info on bands: https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/bands/

# Importing band 2
b2 <- im.import("sentinel.dolomites.b2.tif")

plot(b2, col=magma(100))
plot(b2, col=magma(4))
plot(b2, col=magma(3))
plot(b2, col=magma(500))

# Info about the band
b2









