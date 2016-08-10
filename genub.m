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
function [bounds] = genub(G,F)
global Q
global n
global m

mnQ = m*n*Q;
g = encode(m,n,Q-1,1);
bounds = sparse(mnQ,1);
for h = 1:g
    temp = decode(h);
    temp2 = (temp(1,3)-1)*m+temp(1,1);
    if (temp(1,4) == maxl(temp(1,1),temp(1,2),temp(1,3)))
        bounds(h) = G(temp2,temp(1,2));
    else
        bounds(h) = F(temp2,temp(1,2));
    end
end
end