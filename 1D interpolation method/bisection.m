%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bisection.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% a-> lower bound of the design variable
% b-> upper bound of the design variable
% alpha -> midpoint of a and b
% delx -> dx for central difference method
% df -> derivative at x = a using central difference method
% df_alpha -> derivative at x = alpha
% 
clear all; close all
global icall; icall=0;

a = 40; b = 90;
epsilon = 0.0001; %convergence criteria
delx = 0.01; % dx
fprintf(' iteration    a             b     \n' )
fprintf('---------------------------------\n' )

for i= 1:100  %set max iteration
 fprintf(' %7.0f  %7.3f      %8.3f \n',i, a,b)
 alpha = (a+b)/2;
 %finite different scheme
 df =       (func(a    +delx) - func(a    -delx))/(2*delx);
 df_alpha = (func(alpha+delx) - func(alpha-delx))/(2*delx);
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
fprintf('x* =  %7.3f       Minimum =   %8.3f\n',alpha,func(alpha))
fprintf('icall =  %7.0f   \n',icall)
