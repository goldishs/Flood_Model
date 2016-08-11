####################################################
#Math 3800
#Seth Goldish, Ely Biggs, Taylor Saintable
#
#Flood Model     Main program    Version 0.02
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

# LIBRARIES AND FUNCTIONS
####################################################

### http://gis.stackexchange.com/questions/20955/how-to-generate-a-random-but-believable-digital-elevation-model
#if raster has not yet been installed, run:
#packages.install("raster")
require(raster)
require(fields)
source("Helperfunctions.R")
set.seed(100) # makes the random not random

#where the .png files will be saved
setwd("/Users/goldishs/Desktop/plots")

#terminal command to generate .gif (ImageMagick must be installed)
#convert -delay 10 -loop 0 -magnify *.png flood.gif


####################################################
#   START OF MAIN PROGRAM
####################################################

#dimensions of our grid
n = 200#rows
m = 200#columns
iter = 100# number of iterations
# iter = 75 works well for p_S of 0.05 When elevation is constant.
# when n =100 m=100 and iter =75 the code takes about 1:33 seconds to compile.
# our code is extreamly slow.



###############################################################################################

# trying to creat a new elivaiton matrix that looks more natural.
# i add 8 to the dimensions because the focal function surrounds the
# r.sim matrix with NA values. so i add 8 to each so that asdg becomes an n X m matrix

# declaring raster
r <- raster(ncols = m + 8, nrows = n + 8, xmn = 0)
r[] <- runif(ncell(r), min = 0, max = 1)
#this part makes the elevations look more natural
r.sim <- focal(r, w = GaussianKernel(sigma = 1, n = 9), na.rm = TRUE)
###############################################################################################




# Have to initialize E_data and S_initial like this so they don't inherit raster data type


# convert and extract the non-NA values of the matrix
E = extraction(as.matrix(r.sim))
E = borderize(E,-100000)
#surface water
S = matrix(runif(n * m), n, m)
S = borderize(S,0)

n = dim(E)[1]
m = dim(E)[2]

#initializing the first second layer uniformly
P_W = matrix(runif(n * m), n, m)


# change in time
dt = 1.00



#loop through the matrices and update surface water
for (k in 1:iter) {
  
  # zlim = c(min, max) manually adjust the color scale for each image.
  # thus the max needs to be the true max to the scale all of the images correctly
  
  #http://www.r-bloggers.com/animated-plots-with-r/
  # creating a name for each plot file with leading zeros
  if (k < 10) {name = paste('000',k,'plot.png',sep='')}
  if (k < 100 && k >= 10) {name = paste('00',k,'plot.png', sep='')}
  if (k >= 100) {name = paste('0', k,'plot.png', sep='')}
  
  #saves the surface water plot as a .png file in the working directory
  png(name)
  image.plot(S, zlim = c(0.0, 1),main=paste("t = ",k-1,sep=''))
  dev.off()
  
  # This is the percentage of S that leaves S_(i,j)
  p_S = 0.05
  
  #change in surface water
  delta_S = matrix(rep(0,(n) * (m)),nrow = n,ncol = m)
  S = S + delta_surface_water(E,S,n,m,delta_S,p_S)
  
  # calling the delta water moving to layer 2.
  dP_W = deltaP_W(S, P_W, C = 0.01)
  
  # subtracting surface water from layer 1
  S = S - dP_W
  #updating water in layer 2
  P_W = P_W + dP_W
  
  
  # Also note:
  # when p_S =1 and when intial E  is simple (constant/flat)
  # then S will Flip back and forth between two states. meaning
  # that i dont think it will ever converge (i.e. even out)
  
}

#http://www.r-bloggers.com/animated-plots-with-r/
# creating a name for each plot file with leading zeros
if (iter+1 < 10) {name = paste('000',iter+1,'plot.png',sep='')}
if (iter+1 < 100 && k >= 10) {name = paste('00',iter+1,'plot.png', sep='')}
if (iter+1 >= 100) {name = paste('0', iter+1,'plot.png', sep='')}

#saves the surface water plot as a .png file in the working directory
png(name)
image.plot(S, zlim = c(0.0, 1),main=paste("t = ",iter,sep=''))
dev.off()
#saves the elevations plot as a .png file in the working directory
png("Elevations.png")
image.plot(E, zlim = c(0.0, 1),main="Elevations")
dev.off()
