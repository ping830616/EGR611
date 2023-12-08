% Problem 2.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
global icall; icall=1;
n_of_var = 4;  x = [-3 -1 -3 -1];
epsilon1 = 1e-5;  epsilon2 = 1e-5;
delx = 1e-3;
nmax=5000;

falpha_prev = HW4_func_multivar(x);
fprintf('Initial function value =  %7.4f\n ',falpha_prev)
fprintf(' No.                 x-vector                    f(x)     Deriv \n')
fprintf('_________________________________________________________________\n')
for i = 1:nmax

deriv = HW4_grad_vec(x,delx,n_of_var);
search = -deriv;

[alpha,falpha] = HW4_golden_funct1(x,search); % search is given in step 2 of the pseudo code
x = x + alpha*search;
fprintf('%3d %10.5f %10.5f %10.5f %10.5f % 8.3f  %8.3f  \n',i,x,falpha,norm(deriv))

 if abs(falpha-falpha_prev)<epsilon1 || norm(deriv)<epsilon2
    break;
 end

falpha_prev = falpha;

end
fprintf('_________________________________________________________________\n')
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('x* =  %7.3f   %7.3f    %7.3f    %7.3f \n',x)
fprintf('Minimum =   %8.3f\n',HW4_func_multivar(x))