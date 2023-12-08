%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms k1 x1 x2 lam a
L=k1*x1^(-1)*x2^(-2)+lam*(x1^2+x2^2-a^2);
dLdx1=diff(L,x1,1)
dLdx2=diff(L,x2,1)
dLdlam=diff(L,lam,1)
[x1_sol,x2_sol,lam_sol]=solve(dLdx1,dLdx2,dLdlam,x1,x2,lam)

for i=1:4;
x1=x1_sol(i);x2=x2_sol(i);lam=lam_sol(i);
eval(L)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%