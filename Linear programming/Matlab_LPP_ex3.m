clear all; close all;
c=[-14 -16]';

A=[8 4 
   6 8
   4 6
   1 0];

b=[3440 2880 2760 420]';

%If you are interested only on the solution, then use
options = optimoptions('linprog','Display','iter');
%xsol=linprog(c,A,b,[],[],[],[],options)

%To see if the algorithm really converged or not you need to access the exit flag through:
[xsol,fval,exitflag]=linprog(c,A,b,[],[],[],[],options)

