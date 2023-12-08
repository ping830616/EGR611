%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code grad_vecSUMT.m - SUMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute gradient vector using central difference method
% xvec2, xvec1 -> vector of design variables
% deriv(i) -> derivative w.r.t. ith variable 
%
function deriv = grad_vecSUMT(x,delx,n_of_var,rk)
ideriv=0; % 0 for central difference, 1 or others for forward difference

for i = 1:n_of_var
   xvec1 = x; xvec2 = x;
   xvec2(i) = x(i) + delx; % change i-th DV only.
     if (ideriv == 0),
     xvec1(i) = x(i) - delx;
%     [temp1,fx0,gx10,gx20]=func_const(xvec1,rk);
%     [temp2,fx0,gx10,gx20]=func_const(xvec2,rk);
     [temp1,fx0]=func_const(xvec1,rk);
     [temp2,fx0]=func_const(xvec2,rk);
     deriv(i) = (temp2 - temp1)/(2*delx);
     else 
     xvec1(i) = x(i);
%     [temp1,fx0,gx10,gx20]=func_const(xvec1,rk);
%     [temp2,fx0,gx10,gx20]=func_const(xvec2,rk);
     [temp1,fx0]=func_const(xvec1,rk);
     [temp2,fx0]=func_const(xvec2,rk);
     deriv(i) = (temp2 - temp1)/(delx);
     end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

