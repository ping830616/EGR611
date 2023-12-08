%	% EGR611-HW1-Prob4_1
%
%  Maximize f(x1,x2) = 125*x1 + 150*x2
%
%			g1(x1,x2) : 6*x1 + 11*x2 - 66 <= 0
%			g1(x1,x2) : 8*x1 + 9*x2 - 72 <= 0
%
%			x1 >= 0 
%           x2 >= 0
%
%----------------------------------------------------------------
clear all;
close all;
x1=0:0.1:10;	% the semi-colon at the end prevents the echo 
x2=0:0.1:10;	% these are also the side constraints

for i=1:101  
    for j=1:101
        x1ij=x1(j);    
        x2ij=x2(i);
        f1(i,j) = 125*x1ij + 150*x2ij;  % j:range of x1  i: range of x2
        ineq1(i,j) = 6*x1ij + 11*x2ij - 66;
        ineq2(i,j) = 8*x1ij + 9*x2ij - 72;
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

[C2,h2] = contour(x1,x2,ineq2,[0,0],'r-'); clabel(C2,h2);
set(h2,'LineWidth',2);
[C2,h2] = contour(x1,x2,ineq2,[0.1,0.1],'r--'); clabel(C2,h2);
gtext('g2');















