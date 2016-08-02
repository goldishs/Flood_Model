function [pp] = p(i,j,k,l)
global Q
global n
global m
pp = [0,0,0]
if ((i < m) && (j == 1) && (l == mod(1,4))) || ((i < m) && (j > 1) && (j < n) && l == mod(1,5) || (i == m) && (j >= 1) && (j < n) && l == mod(1,2))
    pp = [i, j + 1, k];
elseif ((i < m) && (j > 1) && (j < n) && l == mod(2,5)) || ((i < m) && (j == n) && l == mod(1,3))
    pp = [i + 1, j - 1, k];
elseif ((i < m) && (j == 1) && (l == mod(2,4))) || ((i < m) && (j > 1) && (j < n) && l == mod(3,5)) || ((i < m) && (j == n) && l == mod(2,3))
    pp = [i + 1, j, k];
elseif ((i < m) && (j == 1) && l == mod(3,4)) || ((i < m) && (j > 1) && (j < n) && l == mod(4,5))
    pp = [i + 1, j + 1, k];
elseif ((i < m) && (j == 1) && (k < Q)) && (l == mod(0,4)) || ((i < m) && (j > 1) && (j < n) && (k < Q) && (l == mod(0,5)) || ((i < m) && (j == n) && (k < Q) && l == mod(0,3) || ((i < m) && (j >= 1) && (j < n) && (k < Q) && (l == mod(0,2)) || (i == m) && (j == n) && (k < Q))))
    pp = [i,j,k+1];
end
%disp(pp);
end

