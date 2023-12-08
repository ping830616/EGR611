% file name : func.m
% x -> input variable to the function
% fx -> output from the function
%
function fx = HW4_func(x)

global icall; icall=icall+1;
% Problem 1.1
   fx = 3*exp(x)-x^3+5*x;
% Problem 1.2
%  fx = -x^3+4*x^2-3*x+5;
% Problem 1.3
%  fx = exp(x^2)-2*x^3;
% Problem 1.4
%  fx = (1/2)*(1-(1/(1+x^2))-x*atan(1/(2*x)));


