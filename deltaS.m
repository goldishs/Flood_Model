function [DS] = deltaS(x)
global Q
global n
global m

DS = sparse(Q*m,n);

for iter = 1:encode(m,n,Q-1,1)
    matdsval = decode(iter);
    xx = matdsval(1,1);
    y = matdsval(1,2);
    z = matdsval(1,3);
    t = (z-1) +xx;
    DS(t,y) = DS(t,y) + x(iter);
end
end