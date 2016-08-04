%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
% This function maps a node with a direction to a index g.
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF encode function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [g] = encode(i,j,k,l)
global Q
global n
global m
if (i < m) && (j == 1)
    g = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+4*(k-1)+l; % i<m,j=1
elseif (i < m) && (1 < j) && (j < n)
    g = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+(4*Q-1)+(5*Q-1)*(j-2)+5*(k-1)+l; % i<m, 1<j<n
elseif (i < m) && (j == n)
    g = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+(4*Q-1)+(5*Q-1)*(n-2)+3*(k-1)+l; % i<m, j=n
elseif (i == m) && (j < n)
    g = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(j-1)+2*(k-1)+l; %i=m, j<n
else
    g = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(n-1)+k; %i=m, j=n
end

end