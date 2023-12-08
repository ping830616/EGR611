% Problem 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Direct subsitution method
clear all
syms x1 x2
f=0.5*(x1^2+x2^2+(1-x1-x2)^2)

dfdx1=diff(f,x1,1); dfdx2=diff(f,x2,1);
[x1_sol,x2_sol]=solve(dfdx1,dfdx2,x1,x2)
[x1_sol x2_sol]

ddfdx1=diff(f,x1,2);
ddfdx2=diff(f,x2,2);
ddfdx12=diff(dfdx1,x2,1);

H=[ddfdx1    ddfdx12
   ddfdx12   ddfdx2]

x1=x1_sol(1);x2=x2_sol(1); eval(H)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lagrange multiplier method

clear all
syms x1 x2 x3 lam1 lam2 
L=0.5*(x1^2+x2^2+x3^2)+lam1*(x1-x2)+lam2*(x1+x2+x3-1);
dLdx1=diff(L,x1,1);
dLdx2=diff(L,x2,1);
dLdx3=diff(L,x3,1);
dLdlam1=diff(L,lam1,1);
dLdlam2=diff(L,lam2,1);

[x1_sol,x2_sol,x3_sol,lam1_sol,lam2_sol]=solve(dLdx1,dLdx2,dLdx3,dLdlam1,dLdlam2,x1,x2,x3,lam1,lam2);


ddLdx1=diff(L,x1,2);
ddLdx2=diff(L,x2,2);
ddLdx3=diff(L,x3,2);

ddLdlam1=diff(L,lam1,2);
ddLdlam2=diff(L,lam2,2);
ddLdlam12=diff(dLdlam1,lam2,2);

ddLdx12=diff(dLdx1,x2,1);
ddLdx13=diff(dLdx1,x3,1);
ddLdx23=diff(dLdx2,x3,1);

ddLdlam1x1=diff(dLdlam1,x1,1);
ddLdlam1x2=diff(dLdlam1,x2,1);
ddLdlam1x3=diff(dLdlam1,x3,1);

ddLdlam2x1=diff(dLdlam2,x1,1);
ddLdlam2x2=diff(dLdlam2,x2,1);
ddLdlam2x3=diff(dLdlam2,x3,1);

H=[ddLdx1    ddLdx12   ddLdx13      ddLdlam1x1  ddLdlam2x1
   ddLdx12   ddLdx2    ddLdx23      ddLdlam1x2  ddLdlam2x2
   ddLdx13   ddLdx23   ddLdx3       ddLdlam1x3  ddLdlam2x3
   ddLdlam1x1 ddLdlam1x2 ddLdlam1x3 ddLdlam1    ddLdlam12
   ddLdlam2x1 ddLdlam2x2 ddLdlam2x3 ddLdlam12   ddLdlam2]



disp('       x1        x2        x3       lam1   lam2     eval(L)')
x1=x1_sol;x2=x2_sol;x3=x3_sol;lam1=lam1_sol; lam2=lam2_sol;
disp(eval([x1 x2 x3 lam1 lam2 eval(L)]));


x1=x1_sol(1);x2=x2_sol(1);x3=x3_sol(1);lam1=lam1_sol(1); lam2=lam2_sol(1);
syms p
H(1,1)=H(1,1)-p; H(2,2)=H(2,2)-p; H(3,3)=H(3,3)-p; 
ddet=det(H);
p_sol=eval(solve(ddet,p))