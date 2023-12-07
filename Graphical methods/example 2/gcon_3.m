function [g31ij,g32ij,g33ij,g34ij]=gcon_3(x1, x2)
g31ij=x1.^2+x2.^2-4; 
g32ij=0.25*x1.^2+0.75*x2.^2-1; 
g33ij=x1+0*x2; 
g34ij=0*x1+x2-5;