
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms x1 f
f=12*x1^5-45*x1^4+40*x1^3+5
dfdx1=diff(f,x1,1)
[x1_sol]=solve(dfdx1,x1)

ddfdx1=diff(f,x1,2)
x1=x1_sol;
disp('[x1_sol eval(ddfdx1) eval(f)]')
[x1_sol eval(ddfdx1) eval(f)]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
