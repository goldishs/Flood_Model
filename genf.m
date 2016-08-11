%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Objective function    Version 1
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF genf.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = genf(ES)
global n
global m
global Q

%unit vectors
mat1 = [1 0 0;0 1 0; 0 0 1; 0 0 0];
matk3 = [0;0;1];

g = encode(m,n,Q-1,1);




x = zeros(g,1);

for h=1:g
    temp = decode(h);
    temp2 = (temp(1,3)-1)*m+temp(1,1);
    temp3 = pf(decode(h));
    temp4 = (temp3(1,3)-1)*m+temp3(1,1);
    x(h) = ((pf(decode(h)) -  decode(h)*mat1)*matk3*(ES(temp2,temp(1,2))-ES(temp4,temp3(1,2)))) + ((1-(pf(decode(h)) -  decode(h)*mat1))*matk3*(ES(temp2,temp(1,2))-ES(temp4,temp3(1,2))));
end
return
end