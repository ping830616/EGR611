% Problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%% Direct subsitution method

clear all
syms x1 x2
f=-9-8*x1-6*x2-4*((3-x1-x2)/2)+2*x1^2+2*x2^2+((3-x1-x2)/2)^2+2*x1*x2+2*x1*((3-x1-x2)/2)

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
syms x1 x2 x3 lam 
L=-9-8*x1-6*x2-4*x3+2*x1^2+2*x2^2+x3^2+2*x1*x2+2*x1*x3+lam*(x1+x2+2*x3-3);
dLdx1=diff(L,x1,1);
dLdx2=diff(L,x2,1);
dLdx3=diff(L,x3,1);
dLdlam=diff(L,lam,1);
[x1_sol,x2_sol,x3_sol,lam_sol]=solve(dLdx1,dLdx2,dLdx3,dLdlam,x1,x2,x3,lam);


ddLdx1=diff(L,x1,2);
ddLdx2=diff(L,x2,2);
ddLdx3=diff(L,x3,2);

ddLdlam=diff(L,lam,2);
ddLdx12=diff(dLdx1,x2,1);
ddLdx13=diff(dLdx1,x3,1);
ddLdx23=diff(dLdx2,x3,1);

ddLdlamx1=diff(dLdlam,x1,1);
ddLdlamx2=diff(dLdlam,x2,1);
ddLdlamx3=diff(dLdlam,x3,1);


H=[ddLdx1    ddLdx12   ddLdx13   ddLdlamx1
   ddLdx12   ddLdx2    ddLdx23   ddLdlamx2
   ddLdx13   ddLdx23   ddLdx3    ddLdlamx3
   ddLdlamx1 ddLdlamx2 ddLdlamx3 ddLdlam]



disp('       x1        x2        x3       lam     eval(L)')
x1=x1_sol;x2=x2_sol;x3=x3_sol;lam=lam_sol;
disp(eval([x1 x2 x3 lam eval(L)]));


x1=x1_sol(1);x2=x2_sol(1);x3=x3_sol(1);lam=lam_sol(1);
syms p
H(1,1)=H(1,1)-p; H(2,2)=H(2,2)-p; H(3,3)=H(3,3)-p; 
ddet=det(H);
p_sol=eval(solve(ddet,p))