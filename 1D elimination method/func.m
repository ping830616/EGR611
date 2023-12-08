% file name : func.m
% x -> input variable to the function
% fx -> output from the function
%
function fx = func(x)
global icall; icall=icall+1;
   fx = 204165.5/(330-2*x) + 10400/(x-20);
%    40  < x < 90
% prob 1
%    fx = 3*x^4+(x-1)^2;
%    0  < x < 4
%
% prob 2
%    fx = -4*x*sin(x);
%    0  < x < pi
%
% prob 3
%     fx = 2*(x-3)^2+exp(0.5*x^2);
%    0  < x < 10
%
% prob 4
%    fx = 3*x^2+12/x^3-5;
%    0.5  < x < 2.5
%
% prob 5
%    fx = 2*x^2+16/x;
%    1  < x < 5
%
% example - finding alpha
%    fx = x^4-8.5*x^3+31.0625*x^2-57*x+45;
%    0  < x 

