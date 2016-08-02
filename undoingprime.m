function [i,j,k,l] = undoingprime(g, m, n, Q)

i = ceil(g/((4*Q-1) + (5*Q-1)*(n-2) + (3*Q-1)))
rj =  g - (((4*Q-1) + (5*Q-1)*(n-2) + (3*Q-1))*(i-1))

if rj<4*Q-1;
    j=1;
end
if i<m;
    if 4*Q-1<rj;
        if rj<4*Q-1+(n-2)*(5*Q-1)+1;
            j=ceil((rj-(4*Q-1))/(5*Q-1))+1;
        end
        if rj>4*Q-1+(n-2)*(5*Q-1);
            j=n
        end
    end
end
if i==m;
    j=ceil(rj/(2*Q-1));
end
j