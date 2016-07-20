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

# LIBRARIES AND FUNCTIONS
####################################################

### http://gis.stackexchange.com/questions/20955/how-to-generate-a-random-but-believable-digital-elevation-model
#if raster has not yet been installed, run:
#packages.install("raster")
require(raster)
require(fields)
source("Helperfunctions.R")
set.seed(100) # makes the random not random 




####################################################
#   START OF MAIN PROGRAM
####################################################

#dimensions of our grid
n=100#rows
m=100#columns
iter = 75# number of iterations 
# iter = 75 works well for p_S of 0.05 When elevation is constant. 
# when n =100 m=100 and iter =75 the code takes about 1:33 seconds to compile. 
# our code is extreamly slow. 


#elevation and surface water matrix initialization
# Create 100x100 random raster with a Z range of 500-1500

# older way of creating the elevation matrix
# Create 100x100 random raster with a Z range of 500-1500

#InitialElevation <- raster(ncols=m, nrows=n, xmn=0)
#InitialElevation[] <- runif(ncell(InitialElevation), min=0, max=500)  


###############################################################################################

# trying to creat a new elivaiton matrix that looks more natural. 
# i add 8 to the dimensions because the focal function surrounds the 
# r.sim matrix with NA values. so i add 8 to each so that asdg becomes an n X m matrix

# declaring raster
r <- raster(ncols=m+8, nrows=n+8, xmn=0)
r[] <- runif(ncell(r), min=0, max=1) 
#this part makes the elevations look more natural
r.sim <- focal(r, w=GaussianKernel(sigma=1, n=9), na.rm = TRUE)
# Convert to a matrix 
asdf = as.matrix(r.sim)
# Extracting the non-NA values of the matrix
asdg = extraction(asdf)
###############################################################################################

InitialSurfaceWater <- raster(ncols=m, nrows=n, xmn=0)
InitialSurfaceWater[] <- runif(ncell(InitialSurfaceWater), min=0, max=50)  

# E_data = c(5,10,10,8,25,30,20,40,25)
# S_initial = c(5,2,1,1.5,2,1.1,4,2.1,0)
# Have to initialize E_data and S_initial like this so they don't inherit raster data type

# E_data = InitialElevation[]
E_data = asdg
S_initial = InitialSurfaceWater[]

E = matrix(E_data,nrow=n,ncol=m,byrow=TRUE)
E = borderize(E,1700)

#surface water
S = matrix(S_initial,nrow=n,ncol=m,byrow=TRUE)
S = borderize(S,0)

n = dim(E)[1]
m = dim(E)[2]
#change in surface water
delta_S = matrix(rep(0,(n)*(m)),nrow=n,ncol=m)

# change in time 
dt = 1.00



#loop through the matrices and update surface water
image.plot(S, zlim = c(0.0, 50))

for (k in 1:iter) {
  
  #change in surface water
  delta_S = matrix(rep(0,(n)*(m)),nrow=n,ncol=m)
  
  # This is the percentage of S that leaves S_(i,j)
  p_S = 0.05
  
  
  for (i in 2:(n-1)) {
    for (j in 2:(m-1)) {
      d=delta_ES(E,S,i,j)
      r=ratio(d)
      Center = S[i,j]
      rt = sum(r)

      delta_S[i-1,j-1] = delta_S[i-1,j-1] + r[1,1]*Center *p_S  
      delta_S[i-1,j] = delta_S[i-1,j] + r[1,2]*Center *p_S  
      delta_S[i-1,j+1] = delta_S[i-1,j+1] + r[1,3]*Center *p_S  
      delta_S[i,j-1] = delta_S[i,j-1] + r[2,1]*Center *p_S  
      delta_S[i,j] = delta_S[i,j] + r[2,2]*Center *p_S  
      delta_S[i,j+1] = delta_S[i,j+1] + r[2,3]*Center *p_S  
      delta_S[i+1,j-1] = delta_S[i+1,j-1] + r[3,1]*Center *p_S  
      delta_S[i+1,j] = delta_S[i+1,j] + r[3,2]*Center *p_S  
      delta_S[i+1,j+1] = delta_S[i+1,j+1] + r[3,3]*Center *p_S   
      
      t = (r[1,1]*Center*p_S + r[1,2]*Center*p_S+ r[1,3]*Center*p_S+ r[2,1]*Center*p_S+ 
             r[2,3]*Center*p_S+ r[3,1]*Center*p_S+ r[3,2]*Center*p_S+ r[3,3]*Center*p_S)
      
      delta_S[i,j] = delta_S[i,j] - t  

    }
  }
  
  S = S + delta_S


  # this function plots the new S maxtrix for every iteration. 
  # note: when dt = 1 and when inital E and S are simple (constant/flat) 
  # then delta_S will be 0 for all iterations. which is expected. 
  
  # Also note:
  # when dt =1 and when intial E  is simple (constant/flat)
  # then S will Flip back and forth between two states. meaning 
  # that i dont think it will ever converge (i.e. even out) 
  
  # zlim = c(min, max) manually adjust the color scale for each image. 
  # thus the max needs to be the true max to the scale all of the images correctly
  
  # i want to move this out side of the loop to see if this speeds up the code.
  image.plot(S, zlim = c(0.0, 210))
}

# moving this outside the loop does provide some speed up. 
#image.plot(S, zlim = c(0.0, 200))
print(S)
