function retval = obj_ex3(X1,X2)
global ELAS SIGALL TAUALL GAM FS GRAV RHO CD FLAGW SPEED LP L DELT

AREA = 0.25* pi*(X1.^2 - X2.^2);

retval = L * AREA * GAM * GRAV;
