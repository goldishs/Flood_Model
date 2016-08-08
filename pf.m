% function [p] = pf(i,j,k,l)
% global Q
% global n
% global m
% if ((i < m) && (j == 1)) || ((i < m) && (j > 1) && (j < n) || (i == m) && (j >= 1) && (j < n))
%     p = [i, j + 1, k];
% elseif ((i < m) && (j > 1) && (j < n)) || ((i < m) && (j == n))
%     p = [i + 1, j - 1, k];
% elseif ((i < m) && (j == 1)) || ((i < m) && (j > 1) && (j < n) || ((i < m) && (j == n)))
%     p = [i + 1, j, k];
% elseif ((i < m) && (j == 1) || ((i < m) && (j > 1) && (j < n)))
%     p = [i + 1, j + 1, k];
% elseif ((i < m) && (j == 1) && (k < Q)) && (((i < m) && (j > 1) && (j < n) && (k < Q)) || ((i < m) && (j == n) && (k < Q) || ((i < m) && (j >= 1) && (j < n) && (k < Q)) || (i == m) && (j == n) && (k < Q)))
%     p = [i,j,k+1];
% else
%     p = [i,j,k];
% end
% end

% i = 5;
% j = 5;
% k = 2;
% l = 3;
=======
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
