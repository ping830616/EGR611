%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code func_const.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
function [pseudo,fx,gx1,gx2,gx3,gx4] = func_const(x, rk)
%
fx=(x(3)+2)^2*x(2)*x(1)^2;
gx1=1-(x(2)^3*x(3))/(71785*x(1)^4);
gx2=(4*x(2)^2-x(1)*x(2))/(12566*(x(2)*x(1)^3-x(1)^4))+1/(5108*x(1)^2)-1;
gx3=1-(140.45*x(1))/(x(2)^3*x(3));
gx4=(x(1)+x(2))/1.5-1;
%
% exterior penalty function
pseudo=fx + rk*( (max(0,gx1))^2 + (max(0,gx2))^2 + (max(0,gx3))^2 + (max(0,gx4))^2);
%
% interior penalty function
% pseudo=fx + rk*( -1/gx1 -1/gx2 );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
