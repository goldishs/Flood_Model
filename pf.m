function [p] = pf(i,j,k,l)
global Q
global n
global m
if ((i < m) && (j == 1) && (l == mod(1,4))) || ((i < m) && (j > 1) && (j < n) && l == mod(1,5) || (i == m) && (j >= 1) && (j < n) && l == mod(1,2))
    p = [i, j + 1, k];
elseif ((i < m) && (j > 1) && (j < n) && l == mod(2,5)) || ((i < m) && (j == n) && l == mod(1,3))
    p = [i + 1, j - 1, k];
elseif ((i < m) && (j == 1) && (l == mod(2,4))) || ((i < m) && (j > 1) && (j < n) && l == mod(3,5)) || ((i < m) && (j == n) && l == mod(2,3))
    p = [i + 1, j, k];
elseif ((i < m) && (j == 1) && l == mod(3,4)) || ((i < m) && (j > 1) && (j < n) && l == mod(4,5))
    p = [i + 1, j + 1, k];
elseif ((i < m) && (j == 1) && (k < Q)) && (l == mod(0,4)) || ((i < m) && (j > 1) && (j < n) && (k < Q) && (l == mod(0,5)) || ((i < m) && (j == n) && (k < Q) && l == mod(0,3) || ((i < m) && (j >= 1) && (j < n) && (k < Q) && (l == mod(0,2)) || (i == m) && (j == n) && (k < Q))))
    p = [i,j,k+1];
else
    p = [0,0,0];
end
end

% i = 5;
% j = 5;
% k = 2;
% l = 3;