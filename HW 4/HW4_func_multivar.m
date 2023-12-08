%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code func_multivar.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Comment the function which is not in use
%
function fx = HW4_func_multivar(x)
global icall; icall=icall+1;

% Problem 2.1
  fx = (x(1)+10*x(2))^2+5*(x(3)-x(4))^2+(x(2)-2*x(3))^4+10*(x(1)-x(4))^4;
%
% Problem 2.2
%  fx = (10*(x(2)-x(1)^2))^2+(1-x(1))^2+90*(x(4)-x(3)^2)^2+(1-x(3))^2+10*(x(2)+x(4)-2)^2+0.1*(x(2)-x(4))^2;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
