%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     ub    Version 1
%
% This function generates upper bound constraints
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF ub function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bounds] = genub(G,F,S,T,C)
global Q
global n
global m

% This value should at the very least be 0 but never negative. 
% C is a constant amount, T.*C represents the maximum hight of water that 
% can be held at a node. Thus T.*C > S for everywhere!
TCS = (T.*C) - S;

% G and F are right now as the code is build are just flow rates. so what
% we need to do is calculate the flow capacity. so the maxium flow from one
% node to another node. 

GS = G.*TCS;

FS = F.*TCS;

mnQ = m*n*Q;
g = encode(m,n,Q-1,1);
bounds = zeros(mnQ,1);
for h = 1:g
    temp = decode(h);
    temp2 = (temp(1,3)-1)*m+temp(1,1);
    if (temp(1,4) == maxl(temp(1,1),temp(1,2),temp(1,3)))
        bounds(h) = GS(temp2,temp(1,2));
    else
        bounds(h) = FS(temp2,temp(1,2));
    end
end
end