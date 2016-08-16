%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Objective function    Version 1
%
%
% Generates the objective functions coefficient matrix
% This
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF genf.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = genf(E)
global n
global m
global Q

%unit vectors
mat1 = [1 0 0;0 1 0; 0 0 1; 0 0 0];
matk3 = [0;0;1];

g = encode(m,n,Q-1,1); % # of variables

x = zeros(g,1);

for h=1:g
    temp = decode(h);
    temp2 = (temp(1,3)-1)*m+temp(1,1);
    temp3 = pf(decode(h));
    temp4 = (temp3(1,3)-1)*m+temp3(1,1);
    % ... allows long statements on multiple lines.
    x(h) = ((pf(decode(h)) -  decode(h)*mat1)*matk3*(E(temp2,temp(1,2))-...
    E(temp4,temp3(1,2)))) + ((1-(pf(decode(h)) -  decode(h)*mat1))*...
    matk3*(E(temp2,temp(1,2))-E(temp4,temp3(1,2))));
end
return
end
