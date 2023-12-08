%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code grad_vec.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xvec2, xvec1 -> vector of design variables
% deriv(i) -> derivative w.r.t. ith variable 
%
function deriv = HW5_grad_vec(x,delx,n_of_var)
ideriv=0; % 0 for central difference, 1 or others for forward difference

for i = 1:n_of_var
xvec1 = x;  xvec2 = x; 
xvec2(i) = x(i) + delx; % change i-th DV only.
   if (ideriv == 0),
    xvec1(i) = x(i) - delx;
    deriv(i) = (HW5_func_multivar(xvec2) - HW5_func_multivar(xvec1))/(2*delx);
   else
    deriv(i) = (HW5_func_multivar(xvec2) - HW5_func_multivar(x) )/(delx);
   end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

