function [A] = Am(l)
%%

global Q
global n
global m
mnQ = m*n*Q
A = zeros(mnQ,encode(m,n,Q-1,l));
%ml = maxl(i,j,k,m,n,Q)
 
z = 0;

for i = 1:m
    for j = 1:n
        for k = 1:Q
            z = z + 1;
            a1 = zeros(1,encode(m,n,Q-1,l));
            for l = 1: maxl(i,j,k)
                a1(1,encode(i,j,k,l)) = 1;
            end
            for ii = max(1,i-1):min(m,i+1)
                for jj = max(1,j-1):min(m,j+1)
                    for kk = max(1,k-1):k
                        for ll = 1: maxl(i,j,k)
                            if p(ii,jj,kk,ll) == [i,j,k]
                                a1(1,encode(ii,jj,kk,ll)) = -1;
                            end
                        end
                        
                    end
                end
            end
            A(z,:) = a1; %What does that say on the board?
        end
    end  
end



%%
end
%%

