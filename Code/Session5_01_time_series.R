# Time series analysis with R

library(terra)
library(imageRy)
library(viridis)

im.list()

EN01 <- im.import("EN_01.png") 
plot(EN01[[1]])

EN13 <- im.import("EN_13.png")
plot(EN13[[1]])

ENset <- c(EN01[[1]], EN13[[1]])
plot(ENset)

jan <- EN01[[1]]
mar <- EN13[[1]]

diffEN = jan - mar
plot(diffEN)

#---

gr <- im.import("greenland")
plot(gr, col=mako(100))
plot(gr, col=inferno(100))

par(mfrow=c(1,2))
plot(gr[[1]], col=inferno(100))
plot(gr[[4]], col=inferno(100))

par(mfrow=c(2,1))
plot(gr[[1]], col=inferno(100))
plot(gr[[4]], col=inferno(100))

difgr = gr[[1]] - gr[[4]]
dev.off()
plot(difgr)

#-----

ndvi <- im.import("NDVI_2020")
im.ridgeline

im.ridgeline(ndvi, 1, "viridis")

names(ndvi) <- c("02_February", "05_May", "08_August", "11_November")
im.ridgeline(ndvi, 1, "viridis")
im.ridgeline(ndvi, 2, "viridis")
im.ridgeline(ndvi, 2, "plasma")

