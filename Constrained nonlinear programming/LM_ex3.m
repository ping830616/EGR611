%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
syms x1 x2 lam 
L=pi*x1^2*x2+lam*(2*pi*x1*x2+2*pi*x1^2-24*pi);
dLdx1=diff(L,x1,1)
dLdx2=diff(L,x2,1)
dLdlam=diff(L,lam,1)
[x1_sol,x2_sol,lam_sol]=solve(dLdx1,dLdx2,dLdlam,x1,x2,lam);


ddLdx1=diff(L,x1,2);
ddLdx2=diff(L,x2,2);
ddLdlam=diff(L,lam,2);
ddLdx12=diff(dLdx1,x2,1);
ddLdlamx1=diff(dLdlam,x1,1);
ddLdlamx2=diff(dLdlam,x2,1);

H=[ddLdx1  ddLdx12  ddLdlamx1
   ddLdx12 ddLdx2   ddLdlamx2
   ddLdlamx1  ddLdlamx2  ddLdlam];


disp('       x1    x2    lam    eval(L)')
for i=1:2;
x1=x1_sol(i);x2=x2_sol(i);lam=lam_sol(i);
disp(eval([x1 x2 lam eval(L)]));
end

x1=x1_sol(1);x2=x2_sol(1);lam=lam_sol(1);

syms p

H(1,1)=H(1,1)-p;
H(2,2)=H(2,2)-p;
ddet=det(H);
p_sol=eval(solve(ddet,p))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

