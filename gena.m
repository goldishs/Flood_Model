%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
%
% this function gereates the A vector for linprog. it was recently updated
% to use sparce to save memory.
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF gena.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A] = gena()
global Q
global n
global m

mnQ = m*n*Q;
A = sparse(mnQ,encode(m,n,Q-1,1));
%ml = maxl(i,j,k,m,n,Q)
 
z = 0;

for i = 1:m
    for j = 1:n
        for k = 1:Q
            z = z + 1;
            a1 = sparse(1,encode(m,n,Q-1,1));
            for l = 1: maxl(i,j,k)
                a1(1,encode(i,j,k,l)) = 1;
            end
            for ii = max(1,i-1):min(m,i+1)
                for jj = max(1,j-1):min(m,j+1)
                    for kk = max(1,k-1):k
                        for ll = 1: maxl(ii,jj,kk)
                            if pf([ii,jj,kk,ll]) == [i,j,k]
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


%A = [A;A];

end


