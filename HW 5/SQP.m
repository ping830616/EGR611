function [x,fval,exitflag] = example
x0 = [0.05 0.25 2];

lb = [0.05,0.25,2];
ub = [2,1.3,15];

Aeq = [];
beq = [];
A = [];
B = [];
opts = optimoptions(@fmincon,'Algorithm','sqp');
fprintf('The sequential quadratic programming (SQP) method:\n')
fprintf('\n')
[x,fval,exitflag] = fmincon(@myobj,x0,A,B,Aeq,beq,lb,ub,@myconstr,opts);

function f = myobj(x)

f = (x(3)+2)^2*x(2)*x(1)^2;
end

function [c, ceq] = myconstr(x)

c = [1-(x(2)^3*x(3))/(71785*x(1)^4)
    (4*x(2)^2-x(1)*x(2))/(12566*(x(2)*x(1)^3-x(1)^4))+1/(5108*x(1)^2)-1
    1-(140.45*x(1))/(x(2)^3*x(3))
    (x(1)+x(2))/1.5-1;];
ceq = [];

end
end


