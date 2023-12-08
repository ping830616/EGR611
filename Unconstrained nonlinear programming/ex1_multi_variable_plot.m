clear all;close all;
x1=-2:0.05:2; m=max(size(x1));
x2=-1:0.05:4; n=max(size(x2)); for i=1:n; for j=1:m;
f(i,j)= 10*x1(j)^4-20*x1(j)^2*x2(i)+10*x2(i)^2+x1(j)^2-2*x1(j)+5;
end;end;

figure (1)
surf(x1,x2,f);axis([-2 2 -1 4 0 30]);
xlabel('x1'); ylabel('x2');

figure (2)
contour(x1,x2,f,[4 4.25 5 6 7 9 14 35 65],"ShowText",true);xlabel('x1'); ylabel('x2');
