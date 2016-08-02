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




% creating Elevations
T1 = 10*rand(m,n);
T2 = 10*rand(m,n);
T3 = 10*rand(m,n);

E1 = T1+T2+T3;
E2 = T2+T3;
E3 = T3;

E = vertcat(E1,E2,E3);
T = vertcat(T1,T2,T3);

C = rand(m*Q,n);
S = 3*rand(m*Q,n);

TCS = T.*C - S;

B = genb(TCS, S);

B = [b1,b2];
end