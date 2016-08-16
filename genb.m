%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
%
% this function gereates the B vector for linprog. it was recently updated
% to use sparce to save memory.
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF genb.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [B] = genb(T,C,S)
global n
global m
global Q

% Be sure that at no point does TCS become negative. it is a strictly
% positive function. 
TCS = (T.*C) - S;
% TCS is a matrix made from matricies from T, C, S 

mnQ = n*m*Q;

% Could use sparce but there is no point since every index is filled. 
b1 = zeros(mnQ, 1); 
b2 = zeros(mnQ, 1); 

z = 0;

for i=1:m

    for j=1:n
        for k=1:Q
            z = z + 1;
            b1(z,1) = S(((k-1)*m+i), j); % limit of S that can leave
            b2(z,1) = TCS(((k-1)*m+i), j); % limit of S that can enter

        end
    end
end

B = [b1;b2];
end