clear all;
close all;
clc;

x31=0:0.01:3;
x32=-5:0.01:5;

for i=1:length(x32)
    for j=1:length(x31)
        f3(i,j)=obj_fun3(x31(j),x32(i));
        [g31(i,j),g32(i,j),g33(i,j),g34(i,j)]=gcon_3(x31(j),x32(i));
    end
end

%% Figure Plots
width=5;
height=5;

figure('Units','inches','Position',[7.5*3,3.5,width,height],'PaperPositionMode','auto');
rn3=[2,3,4,5,6,8,10,15,20,25,30,40,50,60,70,80,100];
contour(x31,x32,f3,rn3,'k','ShowText','on');
hold on;
contour(x31,x32,g31,[0,0],'b','ShowText','on');gtext('g1');
contour(x31,x32,g32,[0,0],'r','ShowText','on');gtext('g2');
contour(x31,x32,g32,[0.1,0.1],'r--','ShowText','on');
contour(x31,x32,g33,[0,0],'g','ShowText','on');gtext('g3');
contour(x31,x32,g34,[0,0],'y','ShowText','on');gtext('g4');
box off;
grid on;
title('Problem 1 (3)');
xlabel('\itx_{\rm1}');
ylabel('\itx_{\rm2}');
set(gca,'fontname','times new roman','FontUnits','points','FontSize',12,...
    'GridLineStyle','--','fontweight','normal');
