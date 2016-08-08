% min pos change in potential energy
function [obj] = objective(h, M)
d = decode(h);
pv = pf(d(1),d(2),d(3),d(4));
t1 = (pf(d(1),d(2),d(3),d(4)) - decode(h)*mm);
m = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
[i,j,k,l] = decode(h);
t1 = p(i,j,k,l)-[i,j,k,l]*m;
S = symsum(diff, h, 0, M)
end

% i = 10;
% j = 10;
% k = 2;
% l = 3;
% h = 3;
% mm = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; %4x3
% vec1 = [0;0;1]

%(p(finv(h))-finv(h).*mm)



