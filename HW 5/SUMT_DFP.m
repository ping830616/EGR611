%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code SUMT_DFP.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear all;close all
n_of_var = 3; %number of design variables
x = [0.05 0.25 2];   %starting point  
epsilon1 = 1e-6;   epsilon2 = 1e-3; 
epsilon3 = 2e-3;
delx = 1e-3;
nmax=500;
A = eye(n_of_var);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rk=1;
fprintf('The exterior penalty function method:\n')
fprintf('\n')

fprintf('Iter NO       Rk                       X(i)                 OBJ:F(x)      Pseudo-OBJ \n')
fprintf('_____________________________________________________________________________________\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for isumt=1:nmax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[falpha_prev,fx,gx1,gx2,gx3,gx4]= func_const(x,rk);

for i = 1:nmax
    if i==1
    deriv = grad_vecSUMT(x,delx,n_of_var,rk);
    search = -deriv;
    [alpha,falpha] = golden_funct1(x,search,rk);
    x = x + alpha*search; falpha = func_const(x,rk);     
    else
     deriv = grad_vecSUMT(x,delx,n_of_var,rk);
     deltax = (alpha*search); deltag = deriv-deriv_prev;
       
     term1 = (deltax'*deltax)/(deltax*deltag');
     term2 = (A*deltag'*deltag*A)/(deltag*A*deltag');
     A = A + term1 - term2;

     search = -A*deriv';  search=search';
     [alpha,falpha] = golden_funct1(x,search,rk);
     x = x+alpha*search; falpha = func_const(x,rk);
    end
       
   if (abs(falpha-falpha_prev)<epsilon1) || (norm(deriv)<epsilon2)
   break;
   end
        
  falpha_prev = falpha; deriv_prev = deriv;
%[pseudo,fx,gx1,gx2] = func_const(x, rk);
%fprintf('%3d      %10.4e    %10.4e %10.4e    %10.4e    %10.4e  \n',...
%         isumt,rk, x, fx, pseudo)

end
%%%%%%% END OF DFP %%%%%%%%%%%%%%%%%%%%%%

[pseudo,fx,gx1,gx2,gx3,gx4] = func_const(x, rk);
fprintf('%3d      %10.4e    %10.4e %10.4e %10.4e    %10.4e    %10.4e  \n',...
         isumt,rk, x, fx, pseudo)

xx(isumt,:)=x;
fxx(isumt)=fx;
gxx1(isumt)=gx1;gxx2(isumt)=gx2;

if (isumt > 1)
 if  max( abs(xx(isumt-1,:)-xx(isumt,:)) ) < epsilon3 || ... 
      ( abs(fxx(isumt-1)-fxx(isumt)) < epsilon3) 
 break;
 end
end
rk=rk*5;  % for exterior penalty
%rk=rk*0.7;  % for interior penalty
end
fprintf('_____________________________________________________________________________________\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
