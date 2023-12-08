%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB code golden_funct1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a-> lower bound of the design variable
% b-> upper bound of the design variable
% alpha -> midpoint of a and b
% falpha1 -> function value at x = alpha1
% falpha2 -> function value at x = alpha2
% epsilon -> constant used to terminate the algorithm
% tau -> 2-golden number
% func_const -> returns the value of a multivariable function
% 
function [alpha1,falpha1] = golden_funct1(x,search,rk)

nmax=40; addx=0.2; adddx_mult=1.5;
epsilon1 = 1.0e-5; epsilon2 = 1.0e-5; % convergence criteria
a = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   addx_temp=0.2*(1/norm(search));
   if(addx > addx_temp)
    addx=addx_temp;
   end
%fprintf('%8.3e \n',addx)   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given initial pt, find the range of sol
fa=func_const(x+a*search,rk);n=1;
%b=a+addx; [fb,fx0,gx10,gx20]=func_const(x+b*search,rk);
b=a+addx; [fb,fx0]=func_const(x+b*search,rk);
   while (fb < fa),
     fa=fb;
     addx=addx*adddx_mult; b=b+addx;
%     [fb,fx0,gx10,gx20]=func_const(x+b*search,rk);
     [fb,fx0]=func_const(x+b*search,rk);
     n=n+1;
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tau = (3-sqrt(5))/2;
alpha1 = a*(1-tau) + b*tau;
alpha2 = a*tau + b*(1-tau);
%[falpha1,fx0,gx10,gx20] = func_const(x+alpha1*search,rk);
%[falpha2,fx0,gx10,gx20] = func_const(x+alpha2*search,rk);
[falpha1,fx0] = func_const(x+alpha1*search,rk);
[falpha2,fx0] = func_const(x+alpha2*search,rk);

for i= 1:nmax
    if falpha1 > falpha2
        a = alpha1;
        alpha1 = alpha2; falpha1 = falpha2;
        alpha2 = tau*a + (1-tau)*b;
%        [falpha2,fx0,gx10,gx20] = func_const(x+alpha2*search,rk);
        [falpha2,fx0] = func_const(x+alpha2*search,rk);
    	else
        b = alpha2;
        alpha2 = alpha1; falpha2 = falpha1;
        alpha1 = tau*b + (1-tau)*a;
%        [falpha1,fx0,gx10,gx20] = func_const(x+alpha1*search,rk);
        [falpha1,fx0] = func_const(x+alpha1*search,rk);
    	end
%[temp1,fx0,gx10,gx20]=func_const(x+alpha1*search,rk);
%[temp2,fx0,gx10,gx20]=func_const(x+alpha2*search,rk);

   if ((abs(falpha1-falpha2)< epsilon1) && (abs(alpha1-alpha2)< epsilon1)),
   break;
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
