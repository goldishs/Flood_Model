####################################################
#Math 3800
#Seth Goldish, Ely Biggs, Taylor Saintable
#
#Flood Model:   Helperfunctions.R
#
#       Functions:
# delta_ES
# ratio
# borderize
#   
#
#
####################################################


#                         delta_ES

# Computes the difference in elevations between a point and its neighbors
# Returns a 3x3 matrix whose 2,2 element is always zero
delta_ES = function(E,S,i,j){
  ES=E+S
  delta = matrix(c(ES[i-1,j-1],ES[i-1,j],ES[i-1,j+1],
                   ES[i,j-1],ES[i,j],ES[i,j+1],
                   ES[i+1,j-1],ES[i+1,j],ES[i+1,j+1]),
                 nrow=3,ncol=3,byrow=TRUE)
  center = delta[2,2]
  for (k in 1:3) {
    for (l in 1:3) {
      d = center - delta[k,l]
      if (d <= 0){
        delta[k,l] = 0
      }
      else {
        delta[k,l] = d
      }
    }
  }
  return(delta)
}

####################################################

#                        ratio

#input: 3x3 matrix
#output: 3x3 matrix with ratio of water going from center to neighbors
ratio = function(m){
  s = sum(m)
  if (s != 0){
    return(m/s)
  }
  else{
    return(m)
  }
}

####################################################

#                      borderize

#make it great! put up a wall!
borderize = function(p,h){
  n = dim(p)[1]+2
  m = dim(p)[2]+2
  border = matrix(rep(h,n*m),nrow=n,ncol=m)
  for (i in 2:(n-1)) {
    for (j in 2:(m-1)) {
      border[i,j] = p[i-1,j-1]
    }
  }
  return(border)
}


####################################################

# Gaussian Kernel Function

# This is part of the code i found off of stack exchange
# it only exist to make a semi -belivable elevaiton matrix.
GaussianKernel <- function(sigma=s, n=d) {
  m <- matrix(nc=n, nr=n)
  col <- rep(1:n, n)
  row <- rep(1:n, each=n)
  x <- col - ceiling(n/2)
  y <- row - ceiling(n/2)
  m[cbind(row, col)] <- 1/(2*pi*sigma^2) * exp(-(x^2+y^2)/(2*sigma^2))
  m / sum(m)
}


####################################################

# extracts the interior of the r.sim matrix. 
# because the raster function sucks i need to create 
# a function that only grabs the inner n X m values
# because converting r.sim to matrix results in a 
# couple of borders of NA. 
extraction = function(p){
  n = dim(p)[1]-8
  m = dim(p)[2]-8
  door = matrix(rep(0,n*m),nrow=n,ncol=m)
  for (i in 4:(n+4)) {
    for (j in 4:(m+4)) {
      door[i-4,j-4] = p[i,j]
    }
  }
  return(door)
}


####################################################

deltaP_W = function(q, W, C){
  n = dim(q)[1]
  m = dim(q)[2]
  # initalizing the delta percent of water that moves from layer 1 to layer 2 matrix
  # C is the percent age of S that goes into the second layer. 
  dP_W = matrix(rep(0,n*m),nrow=n,ncol=m)
  
  for (i in 1:(n)) {
    for (j in 1:(m)) {
      if (W[i,j]>=1){
        dP_W[i,j] = 0  
      }else{
        dP_W[i,j] = C*q[i,j]
      }
    }
  }
  return(dP_W)
}

# compute change in surface water
delta_surface_water = function(E,S,n,m,delta_S,p_S){
  for (i in 2:(n - 1)) {
    for (j in 2:(m - 1)) {
      d = delta_ES(E,S,i,j)
      r = ratio(d)
      Center = S[i,j]
      
      delta_S[i - 1,j - 1] = delta_S[i - 1,j - 1] + r[1,1] * Center * p_S
      delta_S[i - 1,j] = delta_S[i - 1,j] + r[1,2] * Center * p_S
      delta_S[i - 1,j + 1] = delta_S[i - 1,j + 1] + r[1,3] * Center * p_S
      delta_S[i,j - 1] = delta_S[i,j - 1] + r[2,1] * Center * p_S
      delta_S[i,j] = delta_S[i,j] + r[2,2] * Center * p_S
      delta_S[i,j + 1] = delta_S[i,j + 1] + r[2,3] * Center * p_S
      delta_S[i + 1,j - 1] = delta_S[i + 1,j - 1] + r[3,1] * Center * p_S
      delta_S[i + 1,j] = delta_S[i + 1,j] + r[3,2] * Center * p_S
      delta_S[i + 1,j + 1] = delta_S[i + 1,j + 1] + r[3,3] * Center * p_S
      
      t = (
        r[1,1] * Center * p_S + r[1,2] * Center * p_S + r[1,3] * Center * p_S + r[2,1] *
          Center * p_S +
          r[2,3] * Center * p_S + r[3,1] * Center * p_S + r[3,2] * Center *
          p_S + r[3,3] * Center * p_S
      )
      
      delta_S[i,j] = delta_S[i,j] - t
      
    }
  }
  return(delta_S)
}







