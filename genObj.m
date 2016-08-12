%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
%
% the function is incomplete as of now and only servse as a test for the
% pf function. 
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF genObj.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = 4;
mm = [1 0 0;0 1 0; 0 0 1;0 0 0];

global n
global m
global Q
decode(h);



%pf([i,j,k,l])

r = decode(g);
for i = 1:m
    for j = 1:n
        for k = 1:Q
            for l = 1:maxl(i,j,k)
            z = [i,j,k,l];
            disp('input into pf')
            disp(z)    
            disp('output of pf')
            pf([i,j,k,l])
            end
        end
    end
end






