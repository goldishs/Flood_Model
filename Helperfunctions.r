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





