# This code will be used to calculate the amount of biomass of plants

library(terra)
library(imageRy)
library(viridis)
install.packages("viridis")

# listing images
im.list()

# NIR = band 1
# red = band 2
# green = band 3

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# in case you are seeing images upside down, make use of flip()
# m1992f <- flip(m1992)

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
# in case you are seeing images upside down, make use of flip()
# m2006f <- flip(m2006)

par(mfrow=c(1,2))
plot(m1992)
plot(m2006)

# NIR = band 1
# red = band 2
# green = band 3

# rgb
im.plotRGB(m1992, r=1, g=2, b=3, title='Matogrosso 1992')
im.plotRGB(m2006, r=1, g=2, b=3, title='Matogrosso 2006')

im.plotRGB(m1992, r=2, g=1, b=3, title='Matogrosso 1992')
im.plotRGB(m2006, r=2, g=1, b=3, title='Matogrosso 2006')

im.plotRGB(m1992, r=2, g=3, b=1, title='Matogrosso 1992')
im.plotRGB(m2006, r=2, g=3, b=1, title='Matogrosso 2006')

# Difference Vegetation Index
nir1992 <- m1992[[1]] # m1992$matogrosso~2219_lrg_1
red1992 <- m1992[[2]]

nir2006 <- m2006[[1]] 
red2006 <- m2006[[2]]
  
dvi1992 = nir1992 - red1992
dvi2006 = nir2006 - red2006

plot(dvi1992)
plot(dvi2006)

# NDVI: Why using NDVI
# 3 bits image (range: 0-7) - radiometric resolution
# spatial, spectral, radiometric resolutions
# dvi = nir - red = 7 - 0 = 7 maximum dvi
# ndvi = dvi/(nir + red) = 7/(7+0) = 7/7 = 1

# 8 bits image (range: 0-255)
# dvi = nir - red = 255 - 0 = 255 maximum dvi
# ndvi = dvi/(nir + red) = 255/(255+0) = 255/255 = 1

ndvi1992 = dvi1992/(nir1992+red1992)
ndvi2006 = dvi2006/(nir2006+red2006)

plot(ndvi1992)
plot(ndvi2006)

# viridis package
plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

# plot(ndvi1992, col=inferno(3))
# plot(ndvi2006, col=inferno(3))

# im.dvi(), im.ndvi()








