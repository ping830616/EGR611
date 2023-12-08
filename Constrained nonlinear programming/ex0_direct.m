%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms x1 x2
f=8*x1*x2*sqrt(1-x1^2-x2^2)
dfdx1=diff(f,x1,1); dfdx2=diff(f,x2,1);
[x1_sol,x2_sol]=solve(dfdx1,dfdx2,x1,x2)
[x1_sol x2_sol]

ddfdx1=diff(f,x1,2);
ddfdx2=diff(f,x2,2);
ddfdx12=diff(dfdx1,x2,1);

H=[ddfdx1    ddfdx12
   ddfdx12   ddfdx2]

x1=x1_sol(9);x2=x2_sol(9); eval(H)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
