####################################################
#Math 3800
#Seth Goldish, Ely Biggs, Taylor Saintable
#
#Flood Model     Elevation Generator    Version 0.02
#
#
#
#
#
#
#
####################################################

#set the working directory (Helperfunctions.R must be here)
setwd("/Users/goldishs/Desktop/Stochastic-Project/Flood_Model")

### http://gis.stackexchange.com/questions/20955/how-to-generate-a-random-but-believable-digital-elevation-model
#if raster has not yet been installed, run:
#packages.install("raster")
require(raster)
require(fields)
source("Helperfunctions.R")

#where the data files will be saved
setwd("/Users/goldishs/Desktop/data")


set.seed(100) # makes the random not random

m = 10#rows
n = 10#columns
Q = 3#layers

for (i in 1:Q) {
  # declaring raster
  r <- raster(ncols = m + 8, nrows = n + 8, xmn = 0)
  r[] <- runif(ncell(r), min = 0, max = 1)
  #this part makes the elevations look more natural
  r.sim <- focal(r, w = GaussianKernel(sigma = 1, n = 9), na.rm = TRUE)
  
  # convert and extract the non-NA values of the matrix
  E = extraction(as.matrix(r.sim))
  write(t(E),file=paste("data",i,".txt",sep=''),ncolumns = n,sep=' ')
  
  set.seed(i*2)
}
