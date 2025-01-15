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

# Importing the other bands
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

# Plotting bands altogether in a multiframe
par(mfrow=c(1,2))
plot(b4)
plot(b8)

# Exercise: plot the four bands together with 2 rows and 2 columns
par(mfrow=c(2,2))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

sentstack <- c(b2, b3, b4, b8)
sentstack
plot(sentstack)

# deleting the previous graphs
dev.off()

# Plotting with RGB scheme
# image: sentstack
# 1st element of the image: blue (band b2)
# 2nd element of the image: green (band b3)
# 3rd element of the image: red (band b4)
# 4th element of the image: NIR (band b8)

# Just consider the elements of the image (array)
par(mfrow=c(2,2))
im.plotRGB(sentstack, r=3, g=2, b=1) # natural color
im.plotRGB(sentstack, r=4, g=3, b=2) # false color
im.plotRGB(sentstack, r=3, g=4, b=2) # false color
im.plotRGB(sentstack, r=3, g=2, b=4) # false color







