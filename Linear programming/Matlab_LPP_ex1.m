%to see the type of parameters you can use with the linprog.m
clear all; close all;
%options = optimoptions('linprog','Algorithm','dual-simplex','Display','iter')
%options = optimoptions('linprog','Algorithm','interior-point','Display','iter')
%options = optimoptions('linprog','Algorithm','interior-point-legacy','Display','iter')

options = optimoptions('linprog','Display','iter');
c=[-2 -3]';
A=[1 2 
   2 1
   0 1];

b=[8 10 3]';

%If you are interested only on the solution, then use
%xsol=linprog(c,A,b,[],[],[],[],options)

%To see if the algorithm really converged or not you need to access the exit flag through:
[xsol,fval,exitflag,output]=linprog(c,A,b,[],[],[],[],options);
