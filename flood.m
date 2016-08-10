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

%set working directory

%cd('/Users/goldishs/desktop/data')

%dimensions of our grid
global m
global n
global Q 

% m, n, and Q should be 50,50,and 3 in our final version. 

m = 10;%rows
n = 10;%columns
Q = 3;%Total number of layers

V = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(n-1)+(Q-1);%Total number of variables


% creating Elevations (these are randomly generated and are only to test if
% the generating functions work. 
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

%TCS = T.*C - S;


% number of iterations
iter = 50;

% test functions encode and undoing
% i = 100;
% j = 150;
% k = 25;
% l = 3;
i = 5;
j = 5;
k = 2;
l = 1;
g=encode(i,j,k,l);

r = decode(g);


A = gena();
B = genb(T, C, S);
