
function [DS] = deltaS(xnext)
global Q
global n
global m


% What we need to do is create a function takes in every arrow pointing to
% a node and calculates the total water that entered the node and total
% water that left that node, for all nodes.


DS = zeros(Q*m,n);

for itera = 1:encode(m,n,Q-1,1)
    matdsval = decode(itera);
    xx = matdsval(1,1);
    y = matdsval(1,2);
    z = matdsval(1,3);
    t = ((z-1)*m) +xx;
    DS(t,y) = DS(t,y) + xnext(itera);
end
end
