####################################################
#Math 3800
#Seth Goldish, Ely Biggs, Taylor Saintable
#
#Flood Model     Main program    Version 0.01
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
source("Helperfunctions.R")
#set.seed(100) # makes the random not random 




####################################################
#   START OF MAIN PROGRAM
####################################################

#dimensions of our grid
n=100#rows
m=100#columns


#elevation and surface water matrix initialization
# Create 100x100 random raster with a Z range of 500-1500

InitialElevation <- raster(ncols=m, nrows=n, xmn=0)
InitialElevation[] <- runif(ncell(InitialElevation), min=500, max=1500)  

InitialSurfaceWater <- raster(ncols=m, nrows=n, xmn=0)
InitialSurfaceWater[] <- runif(ncell(InitialSurfaceWater), min=0, max=200)  

# E_data = c(5,10,10,8,25,30,20,40,25)
# S_initial = c(5,2,1,1.5,2,1.1,4,2.1,0)
# Have to initialize E_data and S_initial like this so they don't inherit raster data type

E_data = InitialElevation[]
S_initial = InitialSurfaceWater[]

E = matrix(E_data,nrow=n,ncol=m,byrow=TRUE)
E = borderize(E,100)

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


for (k in 1:10) {
  
  #change in surface water
  delta_S = matrix(rep(0,(n)*(m)),nrow=n,ncol=m)
  
  # change in time 
  dt = 1.00
  
  
  for (i in 2:(n-1)) {
    for (j in 2:(m-1)) {
      d=delta_ES(E,S,i,j)
      r=ratio(d)
      Center = S[i,j]
      rt = sum(r)

      delta_S[i-1,j-1] = delta_S[i-1,j-1] + r[1,1]*Center  
      delta_S[i-1,j] = delta_S[i-1,j] + r[1,2]*Center  
      delta_S[i-1,j+1] = delta_S[i-1,j+1] + r[1,3]*Center  
      delta_S[i,j-1] = delta_S[i,j-1] + r[2,1]*Center  
      delta_S[i,j] = delta_S[i,j] + r[2,2]*Center  
      delta_S[i,j+1] = delta_S[i,j+1] + r[2,3]*Center  
      delta_S[i+1,j-1] = delta_S[i+1,j-1] + r[3,1]*Center  
      delta_S[i+1,j] = delta_S[i+1,j] + r[3,2]*Center  
      delta_S[i+1,j+1] = delta_S[i+1,j+1] + r[3,3]*Center  
      
      t = (r[1,1]*Center*dt + r[1,2]*Center*dt+ r[1,3]*Center*dt+ r[2,1]*Center*dt+ 
             r[2,3]*Center*dt+ r[3,1]*Center*dt+ r[3,2]*Center*dt+ r[3,3]*Center*dt)
      
      delta_S[i,j] = delta_S[i,j] - t  
      
      
    }
  }
  
  
  print(S)
  print(sum(S))
  S = S + delta_S
  #print(S)
  print(sum(S))
}
print(S)
