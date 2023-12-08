%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: newtonraphson.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% x -> initial guess of design variable
% delx -> dx for central difference method
% df -> derivative using central difference method
% ddf -> second derivative
% epsilon -> constant used to terminate the program
% xprev -> value of x stored from previous iteration
%
clear all;close all
global icall; icall=0;

x = 40;
delx = 0.01;
epsilon = 0.000000001;
fprintf('     x    f(x)    1st Deriv.  2nd Deriv.\n' )
fprintf('-----------------------------------------\n' )

for i= 1:100
 df = (func(x+delx) - func(x-delx) )/(2*delx);
 ddf= (func(x+delx)+func(x-delx)-2*func(x))/(delx*delx);
fprintf('%8.3f %8.3f %8.3f %8.3f\n',x,func(x),df,ddf)
 xprev = x;
 x = x- df/ddf;
 if abs(x-xprev) < epsilon
    break;
 end
end

fprintf('-----------------------------------------\n' )
fprintf('x* =  %7.3f       Minimum =   %8.3f\n',x,func(x))
fprintf('icall =  %7.0f   \n',icall)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
