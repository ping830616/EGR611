
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms x1 x2 f
f=10*x1^4-20*x1^2*x2+10*x2^2+x1^2-2*x1+5
dfdx1=diff(f,x1,1); dfdx2=diff(f,x2,1);
[x1_sol,x2_sol]=solve(dfdx1,dfdx2,x1,x2)

ddfdx1=diff(f,x1,2);
ddfdx2=diff(f,x2,2);
ddfdx12=diff(dfdx1,x2,1);

H=[ddfdx1    ddfdx12
   ddfdx12   ddfdx2]

x1=x1_sol;x2=x2_sol;
eval(H)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

