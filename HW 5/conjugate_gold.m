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
n_of_var = 4;  x = [3 -1 0 1];
epsilon1 = 1e-5;  epsilon2 = 1e-5;
delx = 1e-3;
nmax=500;

falpha_prev = HW5_func_multivar(x);
fprintf('Initial function value =  %7.4f\n ',falpha_prev)
fprintf(' No.                 x-vector                    f(x)     Deriv \n')
fprintf('_________________________________________________________________\n')
%%%%%%%%%%%%%%%%%%%%
nfresh=1;
%%%%%%%%%%%%%%%%%%%%
for i = 1:nmax
    if nfresh==1
      deriv = HW5_grad_vec(x,delx,n_of_var);
      search = -deriv;
      [alpha,falpha] = HW5_golden_funct1(x,search);
       x = x + alpha*search; falpha = HW5_func_multivar(x);
    else
        deriv = HW5_grad_vec(x,delx,n_of_var);
        beta = ((norm(deriv)^2)/(norm(deriv_prev)^2));
        search = -deriv + beta*search_prev;       
       [alpha,falpha] = HW5_golden_funct1(x,search);
       x = x + alpha*search; falpha = HW5_func_multivar(x);
    end
     if abs(falpha-falpha_prev)<epsilon1 || norm(deriv)<epsilon2
     break;
     end
 %%%%%%%%%%%%%%%%%%%%
    deriv_prev = deriv; search_prev = search;
    falpha_prev=falpha;
    nfresh=nfresh+1;
      if nfresh > n_of_var
      nfresh=1;
      end
%%%%%%%%%%%%%%%%%%%%
 fprintf('%3d %10.5f %10.5f %10.5f %10.5f % 8.3f  %8.3f  \n',i,x,falpha,norm(deriv_prev))
%     fprintf('%3d %8.3e %8.3e %8.3e %8.3e % 8.3e  %8.3e  \n',i,x,falpha_prev,norm(deriv_prev))
end

fprintf('_____________________________________________\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('x* =  %7.3f   %7.3f    %7.3f    %7.3f \n',x)
fprintf('Minimum =   %8.3f\n',HW5_func_multivar(x))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
