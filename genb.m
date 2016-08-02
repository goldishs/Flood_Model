% this function gereates the B vector for linprog
function [B] = genb(TCS, S)
global n
global m
global Q

% TCS is a matrix made from matricies from T, C, S 

mnQ = n*m*Q;

b1 = zeros(mnQ, 1);
b2 = zeros(mnQ, 1);

z = 0;

for i=1:m

    for j=1:n
        for k=1:Q
            z = z + 1;
            b1(z,1) = S(((k-1)*m+i), j);
            b2(z,1) = TCS(((k-1)*m+i), j);

        end
    end
end





B = [b1;b2];
end