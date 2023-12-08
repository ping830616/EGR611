clear all; close all;
c=[-990 -900]';

A=[0.4 0.6 
   3   -1
   3   6 ];

b=[8.5 25 70]';

%If you are interested only on the solution, then use
options = optimoptions('linprog','Display','iter');
%xsol=linprog(c,A,b,[],[],[],[],[],options)

%To see if the algorithm really converged or not you need to access the exit flag through:
[xsol,fval,exitflag]=linprog(c,A,b,[],[],[],[],options)

