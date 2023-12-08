clear all; close all;
c=[2 3 -1]';

A=[-1  2 -3 
    2 -1  4
   -3  2  5 ];

b=[5  -5  7]';

%If you are interested only on the solution, then use
options = optimoptions('linprog','Display','iter');
% xsol=linprog(c,A,b,[],[],[],[],options);

%To see if the algorithm really converged or not you need to access the exit flag through:
[xsol,fval,exitflag,output]=linprog(c,A,b,[],[],[],[],options)

