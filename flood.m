%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Main program    Version 0.1
%
%
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   START OF MAIN PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dimensions of our grid
global m
global n
global Q 

% m, n, and Q should be 50,50,and 3 in our final version. 

m = 5;%rows
n = 5;%columns
Q = 3;%Total number of layers
V = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(n-1)+(Q-1);%Total number of variables

% number of iterations
iter = 50;

% test functions encode and undoing
% i = 100;
% j = 150;
% k = 25;
% l = 3;
i = 10;
j = 10;
k = 2;
l = 3;
g=encode(i,j,k,l);

[i,j,k,l] = decode(g);


A = Am(l);
A = [A;-A];