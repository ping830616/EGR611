%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code func_const.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
function [pseudo,fx,gx1,gx2] = func_const(x, rk)
%
fx=(x(1)-1)^2+(x(2)-5)^2;
gx1=-x(1)^2+x(2)-4;
gx2=-(x(1)-2)^2+x(2)-3;
%
% exterior penalty function
%pseudo=fx + rk*( (max(0,gx1))^2 + (max(0,gx2))^2);
%
% interior penalty function
pseudo=fx + rk*( -1/gx1 -1/gx2 );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
