% EGR611-Fa23-Lec2-Ex0

close all;clear all;

x1=-5:0.1:5; 
x2=-6:0.1:6;
for i=1:121
    for j=1:101
        y(i,j)=x1(j)^2+2*x2(i)^2;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% contour(x1,x2,y, 20, 'ShowText','on');
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rn=[2 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7 3];
contour(x1, x2, y, rn, 'ShowText','on');
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
y2=2-x1;

figure(1)
plot(x1,y2,'-*');
xlabel('x1');
ylabel('x2');