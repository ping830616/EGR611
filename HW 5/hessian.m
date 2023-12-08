%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code hessian.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%compute hessian matrix
% sec_deriv -> second derivative matrix
% func_multivar() -> multivariable function
% temp -> temporary variable
%
function sec_deriv = hessian(x,delx,n_of_var)
for i = 1:n_of_var
        temp = x;
        temp(i) = x(i) + delx;
        term1 = HW5_func_multivar(temp);
        temp(i) = x(i) - delx;
        term2 = HW5_func_multivar(temp);
        term3 = HW5_func_multivar(x);
        sec_deriv(i,i) = (term1-2*term3+term2)/(delx^2);

    for j = i+1:n_of_var
        temp = x;
        temp(i) = x(i) + delx;
        temp(j) = x(j) + delx;
        term1 = HW5_func_multivar(temp);
        
        temp = x;
        temp(i) = x(i) + delx;
        temp(j) = x(j) - delx;
        term2 = HW5_func_multivar(temp);
        
        temp = x;
        temp(i) = x(i) - delx;
        temp(j) = x(j) + delx;
        term3 = HW5_func_multivar(temp);
        
        temp = x;
        temp(i) = x(i) - delx;
        temp(j) = x(j) - delx;
        term4 = HW5_func_multivar(temp);
        sec_deriv(i,j) = (term1-term2-term3+term4)/(4*delx^2);
        
        sec_deriv(j,i)=sec_deriv(i,j);

    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
