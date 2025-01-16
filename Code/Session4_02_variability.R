# How to measure spatial variability (diversity, heterogeneity)

library(imageRy)
library(terra)

im.list()

sent <- im.import("sentinel.png")

# NIR = band 1
# red = band 2
# green = band 3

im.plotRGB(sent, r=1, g=2, b=3, title="Similaun")
im.plotRGB(sent, r=2, g=1, b=3, title="Similaun")
im.plotRGB(sent, r=2, g=2, b=1, title="Similaun")

nir <- sent[[1]]
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

# Exercise: calculate the standard deviation with a moving window of 7x7 pixels
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7)

par(mfrow=c(1,2))
plot(sd3)
plot(sd7)



