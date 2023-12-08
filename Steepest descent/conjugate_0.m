%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code conjugate.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% n_of_var -> number of design variables
% epsilon1,epsilon2 ->constants used for terminating the algorithm
% delx -> required for gradient computation
% falpha_prev -> function valye at first / previous iteration
% deriv -> gradient vector
% search -> search direction (set to negative of gradient)
%
clear all;close all;
global icall; icall=1;
n_of_var = 2;  x = [-2 2];
epsilon1 = 1e-5;  epsilon2 = 1e-5;
delx = 1e-3;
nmax=500;

falpha_prev = func_multivar(x);
fprintf('Initial function value =  %7.4f\n ',falpha_prev)
fprintf(' No.       x-vector         f(x)      Deriv \n')
fprintf('_____________________________________________\n')

for i = 1:nmax
  %For 1st iteration
    if i==1
      deriv_prev = grad_vec(x,delx,n_of_var);
      search_prev = -deriv_prev;
      [alpha,falpha] = golden_funct1(x,search_prev);
      x = x + alpha*search_prev; 
      falpha_prev = func_multivar(x);
    else
       deriv = grad_vec(x,delx,n_of_var);
       beta = ((norm(deriv)^2)/(norm(deriv_prev)^2));
       search = -deriv + beta*search_prev;
       [alpha,falpha] = golden_funct1(x,search);
        x = x + alpha*search;
        falpha = func_multivar(x);

        if abs(falpha-falpha_prev)<epsilon1 || norm(deriv)<epsilon2
        break;
        end

        falpha_prev = falpha;
        deriv_prev  = deriv ; 
        search_prev = search;
        
    end
 fprintf('%3d %10.5f %10.5f  % 8.3f  %8.3f   \n',i,x,falpha,norm(deriv_prev))
end

fprintf('_____________________________________________\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('x* =  %7.3f   %7.3f    \n',x)
fprintf('Minimum =   %8.3f\n',func_multivar(x))

