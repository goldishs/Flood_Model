% min pos change in potential energy
%function [obj] = objective(h, M)
%m = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
%[i,j,k,l] = decode(h);
%term1 = p(i,j,k,l)-[i,j,k,l]*m;
%pmf =
%S = symsum(diff, h, 0, M)
%end

i = 10;
j = 10;
k = 2;
l = 3;
m = [1 0 0; 0 1 0; 0 0 1; 0 0 0];

%(p(finv(h))-)
p(decode(1),decode(2),decode(3),decode(4));