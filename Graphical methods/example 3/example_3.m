%  graphical solution using matlab (two design variables)
%  Optimal design of a Flag Pole for high winds
%----------------------------------------------------
clear all; close all;
global ELAS SIGALL TAUALL GAM FS GRAV RHO CD FLAGW SPEED LP L DELT
%-----------------------------------------------------
% Initialize values
ELAS = 200e+09;   		% Pa
SIGALL = 250E+06; 		% Pa
TAUALL = 145e+06;		% Pa
GAM	= 7860;			% kg/m3
FS = 2.5;			% factor of safety
GRAV = 9.81;			% gravitational acceleration
%-------------------
RHO = 1.225;			% kg/m3
CD = 1.0	;		% drag coefficient
FLAGW = 5000;			% N
SPEED = 156.46	;		% m/s
%-------------------
LP = 8;			% m
L = 10;                 % m
DELT = 0.05;		% m
%------------------
g1val = SIGALL/FS;	% right hand side values
g2val = TAUALL/FS;
g3val = DELT;
g4val = 0.001;
%
x1=0.02:0.01:1;	        % the semi-colon at the end prevents the echo 
x2=0.025:0.01:1;	% these are also the side constraints
% x1 and x2 are vectors filled with numbers 
% note a way to avoid x1 = x2
[X1 X2] = meshgrid(x1,x2);
% generates matrices X1 and X2 correspondin
% vectors x1 and x2

f1 = obj_ex3(X1,X2);% the objecive function is evaluated over the entire mesh

% Constraints are evaluated 
ineq1 = ineq1_ex3(X1,X2)-g1val;
ineq2 = ineq2_ex3(X1,X2)-g2val;
ineq3 = ineq3_ex3(X1,X2)-g3val;
ineq4 = ineq4_ex3(X1,X2)-g4val;

figure(1)
%contour(x1,x2,f1,10);
[C1,h1] = contour(x1,x2,f1,[0,10000,50000,100000, 150000, 200000, 250000, 300000],'g-');
%   [0 0.1 0.3 0.6 0.8 1.0 1.2 1.5 1.8 2.0 2.2 2.4 2.6 2.8 3.0]);
clabel(C1,h1);
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1.0])
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12)
title('Weight of the flagpole')
grid


figure(2)
contour(x1,x2,ineq1,[0,0],'r-'); hold on
contour(x1,x2,ineq1,[0.1*g1val,0.1*g1val],'b--');
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1.0])
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12);
title('g1')
hold off
grid


figure(3)
contour(x1,x2,ineq2,[0,0],'r-');hold on
contour(x1,x2,ineq2,[0.1*g2val,0.1*g2val],'b--');
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1.0])
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12);
title('g2')
hold off
grid


figure(4)
contour(x1,x2,ineq3,[0,0],'r-');hold on
contour(x1,x2,ineq3,[0.1*g3val,0.1*g3val],'b--');
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1.0])
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12);
title('g3')
hold off
grid



figure(5)
contour(x1,x2,ineq4,[0,0],'r-');hold on
contour(x1,x2,ineq4,[0.001*g4val,0.001*g4val],'b-');
set(gca,'xtick',[0 0.2 0.4 0.6 0.8 1.0])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1.0])
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12);
title('g4')
hold off
grid



figure(10)
[C1,h1] = contour(x1,x2,f1,[0,10000,50000,100000, 150000, 200000, 250000, 300000],'g-');
clabel(C1,h1);
xlabel('outside diameter','FontName','times','FontSize',12);
ylabel('inside diameter','FontName','times','FontSize',12)
grid;hold on
contour(x1,x2,ineq1,[0,0],'r-'); 
contour(x1,x2,ineq2,[0,0],'r-');
contour(x1,x2,ineq3,[0,0],'r-');
contour(x1,x2,ineq4,[0,0],'r-');
title('Weight of the flagpole with constraints')
hold off

