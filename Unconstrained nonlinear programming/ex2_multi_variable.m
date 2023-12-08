
%example2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms x1 x2 f
f=x1^3+x2^3+2*x1^2+4*x2^2+6
dfdx1=diff(f,x1,1)
dfdx2=diff(f,x2,1)
[x1_sol,x2_sol]=solve(dfdx1,dfdx2,x1,x2)

ddfdx1=diff(f,x1,2)
ddfdx2=diff(f,x2,2)
ddfdx12=diff(dfdx1,x2,1)

H=[ddfdx1  ddfdx12 
   ddfdx12 ddfdx2 ];

x1=x1_sol(1);x2=x2_sol(1);
eval(H)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

