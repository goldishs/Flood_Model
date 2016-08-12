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

% T1 = 10+2*rand(m,n);
% T2 = 10+2*rand(m,n);
% T3 = 10+2*rand(m,n);

T1 = dlmread('data1.txt');
T2 = dlmread('data2.txt');
T3 = dlmread('data3.txt');

E1 = T1+T2+T3;
E2 = T2+T3;
E3 = T3;
% figure(1)
% mesh(E1)
% figure(2)
% mesh(E2)
% figure(3)
% mesh(E3)

E = vertcat(E1,E2,E3);
T = vertcat(T1,T2,T3);


%C = rand(m*Q,n);
C=zeros(m*Q,n);
S = 1+rand(m*Q,n);

% number of iterations
iter = 1;

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

G = rand(m*Q,n);
F = rand(m*Q,n);

A = gena();
ub = genub(G,F);%upper boundary constraints
lb = -ub;%lower boundary constraints
%ub = [];
Aeq = [];
beq = [];
x0=[];
%dual simplex will fail immediately if there is no feasible solution
options = optimoptions('linprog','Algorithm','dual-simplex');
for time = 1:iter
    ES = E+S;%elevation + surface water
    b = genb(T,C,S);%rhs of inequality constraints
    %f = ones(encode(m,n,Q-1,1),1);%objective function
    %f = vertcat(ones(V/2,1),-1*ones(V/2,1));%objective function
    f = genf(ES);%objective function
    [x,feval,flag]= linprog(f,A,b,Aeq,beq,lb,ub,x0,options);%find optimal solution
    ds = deltaS(x);
    S = S+ ds;
end
%%