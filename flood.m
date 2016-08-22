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

% this just allows us to read in data created from R. 
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

% T1 = 10+ones(m,n);
% T2 = 10+ones(m,n);
% T3 = 10+2*rand(m,n);


 
T1 = dlmread('data1.txt');
T2 = dlmread('data2.txt');
T3 = dlmread('data3.txt');

T1 = 100*T1;
T2 = 100*T2;
T3 = 100*T3;



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

% C is assumed to be just rocks.
% C is the porosity of a land type.
C =  0.25*ones(m*Q,n);

S = rand(m*Q,n);
%C = S./T;

% number of iterations
iter = 10;

% initializing G and F rates. determined by land type.
% G = rand(m*Q,n);
% F = rand(m*Q,n);
G = 0.24* ones(m*Q, n);
F = 0.67* ones(m*Q, n);

A = gena();
f = genf(E);%objective function, we are minimizing negative potental energy


%ub = [];
Aeq = [];
beq = [];
x0=[];
%dual simplex will fail immediately if there is no feasible solution
options = optimoptions('linprog','Algorithm','dual-simplex');
for time = 1:iter
   
    ub = genub(G,F);%upper boundary constraints
    lb = -ub;%lower boundary constraints
    b = genb(T,C,S);%rhs of inequality constraints
    [x,feval,flag]= linprog(f,A,b,Aeq,beq,lb,ub,x0,options);%find optimal solution
    DS = deltaS(x); % creating delta S matrix. 
    %S=S+DS;

end
%%
