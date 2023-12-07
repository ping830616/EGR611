%	graphical solution using matlab (two design variables)
%	the following script should allow the graphical solution
%
%	Minimize	f(x1,x2) = (x1-3)**2 + (x2-2)**2
%
%			h1(x1,x2) = 2x1 + x2 - 8 = 0
%			h2(x1,x2) = (x1-1)^2 + (x2-4)^2 -4 =0
%
%			g1(x1,x2) : x1 + x2 - 7 <= 0
%			g1(x1,x2) : x1 - 0.25 x2^2 <= 0.0
%
%			0 <= x1 <= 10 
%           0 <= x2 <= 10
%
%----------------------------------------------------------------
clear all;
close all;
x1=0:0.1:10;	% the semi-colon at the end prevents the echo 
x2=0:0.1:10;	% these are also the side constraints

%[X1 X2]=meshgrid(x1,x2);

for i=1:101  
    for j=1:101
        x1ij=x1(j);    
        x2ij=x2(i);
        f1(i,j) =    obj_ex1(x1ij,x2ij);  % j:range of x1  i: range of x2
        ineq1(i,j) = inecon1(x1ij,x2ij);
        ineq2(i,j) = inecon2(x1ij,x2ij);
        eq1(i,j) =    eqcon1(x1ij,x2ij);
        eq2(i,j) =    eqcon2(x1ij,x2ij);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the objecive function is evaluated over the entire mesh
[C,h] = contour(x1,x2,f1,'g'); clabel(C,h);

xlabel(' x1 values','FontName','times','FontSize',12,'FontWeight','bold');	
ylabel(' x2 values','FontName','times','FontSize',12,'FontWeight','bold');

grid on;
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ineq1 is plotted [at the contour value of 0]
[C1,h1] = contour(x1,x2,ineq1,[0,0],'r-'); clabel(C1,h1);
[C1,h1] = contour(x1,x2,ineq1,[0.1,0.1],'r--'); clabel(C1,h1);
gtext('g1');
% will place the string 'g1' on the lot where mouse is clicked

[C2,h2] = contour(x1,x2,ineq2,[0,0],'r-'); clabel(C2,h2);
[C2,h2] = contour(x1,x2,ineq2,[0.1,0.1],'r--'); clabel(C2,h2);
gtext('g2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C3,h3] = contour(x1,x2,eq1,[0,0],'b-'); clabel(C3,h3);
gtext('h1');

[C4,h4] = contour(x1,x2,eq2,[0,0],'b-'); clabel(C4,h4);
gtext('h2');
hold off

