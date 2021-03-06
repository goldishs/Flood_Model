%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
%
% this function looks at the node and direction l you give it and returns
% the i,j,k values of the node being pointed to in 
% the form of vector p.
%
%
% This function will only take in a 1 X 4 vector containing values for 
% i,j,k,and l.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF pf.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p] = pf(r)
global Q
global n
global m

% This function is still broken! it works for every input of i,j,k,l except
% for the bottom layer, Q=3 and k=3 in this case, which makes sense since 
% we aren't checking for cases when k=Q in the first 4 if statements. 


if (((r(1) < m) && (r(2) == 1) && (1 == mod(r(4),4)))) || (((r(1) < m) && (r(2) > 1) && (r(2) < n) && 1 == mod(r(4),5)) || ((r(1) == m) && (r(2) >= 1) && (r(2) < n) && 1 == mod(r(4),2)))
    p = [r(1), r(2) + 1, r(3)];
elseif (((r(1) < m) && (r(2) > 1) && (r(2) < n) && 2 == mod(r(4),5))) || (((r(1) < m) && (r(2) == n) && 1 == mod(r(4),3)))
    p = [r(1) + 1, r(2) - 1, r(3)];
elseif (((r(1) < m) && (r(2) == 1) && (2 == mod(r(4),4)))) || (((r(1) < m) && (r(2) > 1) && (r(2) < n) && 3 == mod(r(4),5))) || (((r(1) < m) && (r(2) == n) && 2 == mod(r(4),3)))
    p = [r(1) + 1, r(2), r(3)];
elseif (((r(1) < m) && (r(2) == 1) && 3 == mod(r(4),4)) )|| (((r(1) < m) && (r(2) > 1) && (r(2) < n) && 4 == mod(r(4),5)))
    p = [r(1) + 1, r(2) + 1, r(3)];
elseif (((r(1) < m) && (r(2) == 1) && (r(3) < Q)) && (0 == mod(r(4),4))) || (((r(1) < m) &&(r(2) > 1) && (r(2) < n) && (r(3) < Q) && (0 == mod(r(4),5)) )|| (((r(1) < m) && (r(2) == n) && (r(3) < Q) && 0 == mod(r(4),3) )|| (((r(1) == m) && (r(2) >= 1) && (r(2) < n) && (r(3) < Q) && (0 == mod(r(4),2))) ||( (r(1) == m) && (r(2) == n) && (r(3) < Q)))))
    p = [r(1),r(2),r(3)+1];
else
    p = [r(1),r(2),r(3)]; % need thr(1)s for the r(1) = m, j = n, and r(3) = Q case.
    fprintf('warning in pf. Gridpoint: (%d,%d,%d,%d)\n' , r(1), r(2), r(3),r(4));
end

%dr(1)sp(pp);
end

