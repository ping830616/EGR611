%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code func_multivar.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Comment the function which is not in use
%
function fx = func_multivar(x)
global icall; icall=icall+1;

% Spring system
fx = 100*( sqrt(x(1)^2+(x(2)+1)^2)-1 )^2 + 90*( sqrt(x(1)^2+(x(2)-  1)^2)-1 )^2 -(20*x(1)+40*x(2));
%
% Rosenbrock function
%fx = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
