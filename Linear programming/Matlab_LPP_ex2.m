clear all; close all;
c=[1 -2 3 -4 5 -6]';
c=-c;
Aeq=[1 1  1 1 1 1
     5 0 -3 0 1 0]; 
beq=[10 15]';

B1=[1 2 3 0 0 0
    0 1 2 3 0 0 
    0 0 1 2 3 0 
    0 0 0 1 2 3]; 
b1=[5 7 8 8]';

D1=[3 0 0  0 -2 1
    0 4 0 -2  0 3]; 
d1=[5 7]'; 

lb=[-2 0 -1 -1 -5  1]'; 
ub=[ 7 2  2  3  4 10]';

A=[-B1
    D1]; 
b=[-b1
    d1];

options = optimoptions('linprog','Display','iter');
[xsol,fval,exitflag,output]=linprog(c,A,b,Aeq,beq,lb,ub,options);

fprintf('%s','Reason for termination:')
if (exitflag)
fprintf('%s \n',' Convergence.');
else
fprintf('%s \n',' No convergence.');
end

