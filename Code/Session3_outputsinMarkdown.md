# How to import images in R and export them

## Importing images
In order to import images, the following steps should be implemented:
+ setting the working directory
+ importing the data by the rast() function of the terra package

``` r
# Code for importing remote sensing data from outside R

library(terra)

# Setting the working directory
setwd("~/Downloads")

# Windowds: "C:\\path\Downloads" -> "C://path/Downloads"

getwd()

cal <- rast("altadenaeatonwide_aviris_20250111_lrg.jpg")
plot(cal)
```

![altadenaeatonwide_aviris_20250111_lrg](https://github.com/user-attachments/assets/705fe413-1ecb-4a7b-9d77-7684f3a7597a)

## Exporting images analysed in R

In order to export images I will make use of the writeRaster() function of the terra package.

``` r

# Analysing he uploaded data
# Original coord: 0, 1440, 0, 600  (xmin, xmax, ymin, ymax)
ext <- c(100, 1000, 100, 500)
calcrop <- crop(cal, ext)
plot(calcrop)

# Exporting data
writeRaster(calcrop, "calcrop.png")
```

![calcrop](https://github.com/user-attachments/assets/fa65ccde-af4e-403d-8934-5735943b2c2a)


> Obviously this can be done with any kind of image.

``` r

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
``` 

![Sun_STEREO_4dec2006_lrg](https://github.com/user-attachments/assets/24b0e2ca-8444-4391-924c-cda661ff38e0)

![suncrop](https://github.com/user-attachments/assets/79629c15-cd6e-4174-8ddd-b5d12b85e656)

