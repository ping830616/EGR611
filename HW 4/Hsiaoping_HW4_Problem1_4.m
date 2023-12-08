% Problem 1.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ===== Golden Selection Method =====
clear all;close all
global icall; icall=0;

a = 0;
b = 3;
epsilon = 0.0000001;
tau = 0.381967;
nmax=40;
alpha1 = a*(1-tau) + b*tau;
alpha2 = a*tau + b*(1-tau);
falpha1 = HW4_func(alpha1);
falpha2 = HW4_func(alpha2);

fprintf('\n' )
fprintf('Golden Selection Method:\n' )
fprintf('iter     a             b     \n' )
fprintf('-----------------------------\n' )

for i= 1:nmax
    fprintf('%7.0f  %7.3f      %8.3f     \n',i, a,b)
    if falpha1 > falpha2
        a = alpha1;
        alpha1 = alpha2;
        falpha1 = falpha2;
        alpha2 = tau*a + (1-tau)*b;
        falpha2 = HW4_func(alpha2);
    else
        b = alpha2;
        alpha2 = alpha1;
        falpha2 = falpha1;
        alpha1 = tau*b + (1-tau)*a;
        falpha1 = HW4_func(alpha1);
    end

    if abs(falpha1-falpha2)< epsilon
    break;
    end
end

fprintf('-------------------------\n' )
fprintf('x* =  %7.3f       Minimum =   %8.3f\n',alpha1,HW4_func(alpha1))
fprintf('icall =  %7.0f   \n',icall)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ===== Bisection Method =====
delx = 0.01; % dx
fprintf('\n' )
fprintf('Bisection Method:\n' )
fprintf(' iteration    a             b     \n' )
fprintf('---------------------------------\n' )

for i= 1:100  %set max iteration
 fprintf(' %7.0f  %7.3f      %8.3f \n',i, a,b)
 alpha = (a+b)/2;
 %finite different scheme
 df =       (HW4_func(a    +delx) - HW4_func(a    -delx))/(2*delx);
 df_alpha = (HW4_func(alpha+delx) - HW4_func(alpha-delx))/(2*delx);
if (df*df_alpha) < 0,
 b = alpha;
else
 a = alpha;
end

if (abs(a-b) < epsilon),
break;
end
end

fprintf('-------------------------\n' )
fprintf('x* =  %7.3f       Minimum =   %8.3f\n',alpha,HW4_func(alpha))
fprintf('icall =  %7.0f   \n',icall)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ===== Newton-Raphon Method =====
x = 0.1;
fprintf('\n' )
fprintf('Newton-Raphon Method:\n' )
fprintf('     x    f(x)    1st Deriv.  2nd Deriv.\n' )
fprintf('-----------------------------------------\n' )

for i= 1:100
 df = (HW4_func(x+delx) - HW4_func(x-delx) )/(2*delx);
 ddf= (HW4_func(x+delx)+HW4_func(x-delx)-2*HW4_func(x))/(delx*delx);
fprintf('%8.3f %8.3f %8.3f %8.3f\n',x,HW4_func(x),df,ddf)
 xprev = x;
 x = x- df/ddf;
 if abs(x-xprev) < epsilon
    break;
 end
end

fprintf('-----------------------------------------\n' )
fprintf('x* =  %7.3f       Minimum =   %8.3f\n',x,HW4_func(x))
fprintf('icall =  %7.0f   \n',icall)


