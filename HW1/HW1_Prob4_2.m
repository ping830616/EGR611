%	% EGR611-HW1-Prob4_2
%
%  Minimize f(x1,x2) = x1**4 - 2*(x1**2)*x2 + x1**2 + x1*x2**2 - 2*x1 + 4
%
%			h1(x1,x2) = x1**2 + x2**2 - 4 = 0
% 
%           g1(x1,x2) : 0.25*x1**2 + 0.75*x2**2 - 1 <= 0
%
%			0 <= x1 <= 5
%           0 <= x2 <= 5
%
%----------------------------------------------------------------
clear all;
close all;
x1=0:0.1:5;	% the semi-colon at the end prevents the echo 
x2=0:0.1:5;	% these are also the side constraints

for i=1:51  
    for j=1:51
        x1ij=x1(j);    
        x2ij=x2(i);
        f1(i,j) = x1ij^4 - 2*(x1ij^2)*x2ij + x1ij^2 + x1ij*x2ij^2 - 2*x1ij + 4;  
        ineq1(i,j) = 0.25*x1ij^2 + 0.75*x2ij^2 - 1;
        eq1(i,j) = x1ij^2 + x2ij^2 - 4 ;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the objecive function is evaluated over the entire mesh
[C,h] = contour(x1,x2,f1,'g'); %clabel(C,h);
clabel(C,h,'FontName','times','FontSize',12,'FontWeight','bold');
set(h,'LineWidth',2);

xlabel(' x1 values','FontName','times','FontSize',12,'FontWeight','bold');	
ylabel(' x2 values','FontName','times','FontSize',12,'FontWeight','bold');

grid on;
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ineq1 is plotted [at the contour value of 0]
[C1,h1] = contour(x1,x2,ineq1,[0,0],'r-'); clabel(C1,h1);
set(h1,'LineWidth',2);
[C1,h1] = contour(x1,x2,ineq1,[0.1,0.1],'r--'); clabel(C1,h1);
gtext('g1'); % Place the string 'g1' on the plot where mouse is clicked

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[C2,h2] = contour(x1,x2,eq1,[0,0],'b-'); clabel(C2,h2);
set(h2,'LineWidth',2);
gtext('h1');
hold off




