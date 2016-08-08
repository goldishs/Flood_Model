function [p] = pf(i,j,k,l)
global Q
global n
global m
if ((i < m) && (j == 1)) || ((i < m) && (j > 1) && (j < n) || (i == m) && (j >= 1) && (j < n))
    p = [i, j + 1, k];
elseif ((i < m) && (j > 1) && (j < n)) || ((i < m) && (j == n))
    p = [i + 1, j - 1, k];
elseif ((i < m) && (j == 1)) || ((i < m) && (j > 1) && (j < n) || ((i < m) && (j == n)))
    p = [i + 1, j, k];
elseif ((i < m) && (j == 1) || ((i < m) && (j > 1) && (j < n)))
    p = [i + 1, j + 1, k];
elseif ((i < m) && (j == 1) && (k < Q)) && (((i < m) && (j > 1) && (j < n) && (k < Q)) || ((i < m) && (j == n) && (k < Q) || ((i < m) && (j >= 1) && (j < n) && (k < Q)) || (i == m) && (j == n) && (k < Q)))
    p = [i,j,k+1];
else
    p = [i,j,k];
end
end

% i = 5;
% j = 5;
% k = 2;
% l = 3;