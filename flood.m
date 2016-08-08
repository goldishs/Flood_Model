%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math 3800
%Seth Goldish, Ely Biggs, Taylor Saintable
%
%Flood Model     Main program    Version 0.02
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
cd('/Users/Taylor/Documents/CAT_MOD/Flood_Model')
% E = dlmread('E1.txt');
%dimensions of our grid

global m
global n
global Q

m = 5;%rows
n = 5;%columns
Q = 3;%Total number of layers

i = 5;
j = 5;
k = 2;
l = 3;

V = ((4*Q-1)+(n-2)*(5*Q-1)+(3*Q-1))*(m-1)+(2*Q-1)*(n-1)+(Q-1);%Total number of variables

g=encode(i,j,k,l);
h = decode(g);

A = gena(l);
