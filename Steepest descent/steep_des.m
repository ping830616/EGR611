%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code steep_des.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% epsilon1,epsilon2 ->constants used for terminating the algorithm
% delx -> required for gradient computation
% falpha_prev -> function valye at first / previous iteration
% deriv -> gradient vector
% search -> search direction (set to negative of gradient)
%
clear all;close all;
global icall; icall=1;
n_of_var = 2;  x = [-2. 2.];
epsilon1 = 1e-5;  epsilon2 = 1e-5;
delx = 1e-3;
nmax=5000;

falpha_prev = func_multivar(x);
fprintf('Initial function value =  %7.4f\n ',falpha_prev)
fprintf(' No.       x-vector         f(x)      Deriv \n')
fprintf('_____________________________________________\n')
for i = 1:nmax

deriv = grad_vec(x,delx,n_of_var);
search = -deriv;

[alpha,falpha] = golden_funct1(x,search); % search is given in step 2 of the pseudo code
x = x + alpha*search;
fprintf('%3d %10.5f %10.5f  % 8.3f  %8.3f  \n',i,x,falpha,norm(deriv))

 if abs(falpha-falpha_prev)<epsilon1 || norm(deriv)<epsilon2
    break;
 end

falpha_prev = falpha;

end
fprintf('_____________________________________________\n')
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('x* =  %7.3f   %7.3f    \n',x)
fprintf('Minimum =   %8.3f\n',func_multivar(x))

