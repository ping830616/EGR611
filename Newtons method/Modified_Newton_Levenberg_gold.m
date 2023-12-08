%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code modified_newton.m + Golden Section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear all;close all;
global icall; icall=0;
n_of_var = 2;       %number of design variables
x=[-2 2]  ;    
epsilon1 = 1e-5;   epsilon2 = 1e-3;
delx = 1e-3; % results are sensitive w.r.t. del x
nmax=40;

falpha_prev = func_multivar(x);
deriv = grad_vec(x,delx,n_of_var);
fprintf('Initial Designe Variables \n  %8.3f %8.3f    \n',x)
fprintf('Initial function value =  %7.4f\n ',falpha_prev)
fprintf(' No.       x-vector              f(x)      Deriv \n')
fprintf('____________________________________________________________________\n')
%%%%%%%%%%%%%%%%%
beta = 100;
%%%%%%%%%%%%%%%%%
for i = 1:nmax
%    deriv = grad_vec(x,delx,n_of_var);
    sec_deriv = hessian(x,delx,n_of_var);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    search = -inv(sec_deriv+beta*eye(length(x)))*deriv'; search = search';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [alpha,falpha] = golden_funct1(x,search);
    x = x + alpha*search; falpha = func_multivar(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   if falpha < falpha_prev
   beta = beta/2;
   else
   beta = 2*beta;
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    deriv = grad_vec(x,delx,n_of_var);

  fprintf('%3d %10.3f %10.3f  %8.3f     %8.3f  \n',i,x,falpha,norm(deriv))

   if (abs(falpha-falpha_prev)<epsilon1) && (norm(deriv)<epsilon2)
   break;
   end

  falpha_prev = falpha; 
end

fprintf('____________________________________________________________________\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('x* = %7.3f %7.3f \n',x)
fprintf('Minimum = %8.3f\n',func_multivar(x))
