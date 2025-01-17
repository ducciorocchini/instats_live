# Classifying remotely sensed data

library(terra)
library(imageRy)
library(ggplot2)
# install.packages("patchwork")
library(patchwork)


im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sunc <- im.classify(sun, num_clusters=3)

# 1st class in my case = high energy
# 2nd class in my case = medium energy
# 3rd class in my case = low energy

#---- Matogrosso example

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

par(mfrow=c(1,2))
plot(m1992)
plot(m2006)

m1992c <- im.classify(m1992, num_clusters=2)
# in my case!:
# forest = class1
# human = class2

m2006c <- im.classify(m2006, num_clusters=2)
# in my case!:
# forest = class2
# human = class1

f1992 <- freq(m1992c)
tot1992 <- ncell(m1992c)
p1992 = f1992 * 100 / tot1992

# forest = 83%
# human = 17%

f2006 <- freq(m2006c)
tot2006 <- ncell(m2006c)
p2006 = f2006 * 100 / tot2006

# forest = 45%
# human = 55%

class <- c("Forest", "Human")
y1992 <- c(83, 17)
y2006 <- c(45, 55)
tabout <- data.frame(class, y1992, y2006)

p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2
p1 / p2




