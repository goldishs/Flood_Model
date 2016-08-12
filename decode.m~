%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Tableau Generator    Version 1
%
%
% decode is the inverse of the encode function meaning you enter an index
% g and it will return a 1 X 4 vector r that contains i,j,k,l. 
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF decode.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [r] = decode(g)
global Q
global n
global m
% n is column
% m is row



% finding i first
i = ceil(g/((4*Q-1) + (5*Q-1)*(n-2) + (3*Q-1)));
rj =  g - ((4*Q-1) + (5*Q-1)*(n-2) + (3*Q-1))*(i-1);
%
% finding j 
% if (rj <= ((4*Q-1) && i < m))
%     j=1
% elseif (4*Q <= rj <= ( (4*Q-1) + (n-2)*(5*Q-1)) && i < m)
%     j = ceil((rj - (4*Q-1))/(5*Q-1))+1
% elseif (i < m)
%     j=n
% elseif (i==m) 
%     j = ceil(rj/(2*Q-1))
% end


if i<m;
    if rj<4*Q;
        j=1;
    end
    if 4*Q-1<rj;
        if rj<4*Q-1+(n-2)*(5*Q-1)+1;
            j=ceil((rj-(4*Q-1))/(5*Q-1))+1;
        end
        if rj>4*Q-1+(n-2)*(5*Q-1);
            j=n;
        end
    end
end
if i==m;
    j=ceil(rj/(2*Q-1));
end


% finding rk
if (j==1 && i < m)
    rk=rj;
elseif (1<j && i<m)
    rk = rj - (4*Q-1) - (j-2)*(5*Q-1);
elseif (i==m)
    rk = rj -(2*Q-1)*(j-1);
else
    x=5
end
    
% finding k 
if (j==1 && i<m)
    k= ceil(rk/(4));
    
elseif (1< j && j <n && i<m)
    k = ceil(rk/(5));
elseif (j==n && i<m)
    k = ceil( rk/(3));
elseif (i==m && j<n)
    k = ceil(rk /(2));
elseif(i==m && j==n)
    k = rk;
else
    x=7
end
    
    
    % finding l
if (i < m) && (j == 1)

    l = g-(((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+4*(k-1)); % i<m,j=1
elseif (i < m) && (1 < j) && (j < n)

    l = g-(((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+(4*Q-1)+(5*Q-1)*(j-2)+5*(k-1)); % i<m, 1<j<n
elseif (i < m) && (j == n)

    l = g-(((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(i-1)+(4*Q-1)+(5*Q-1)*(n-2)+3*(k-1)); % i<m, j=n
elseif (i == m) && (j < n)

    l = g-(((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(j-1)+2*(k-1)); %i=m, j<n
elseif (i==m && j==n)

    %l = g-(((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(n-1))+k; %i=m, j=n
    if (k==Q)
        disp('ERROR')
    else
        l=1;
    end
end
    
    %
    r=[i,j,k,l];


%return(i,j,k,l)
end 