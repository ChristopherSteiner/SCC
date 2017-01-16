function [ u ] = Heat_PDE_Task1_7( xrange, trange, u_initial, ...
    u0_boundary, uL_boundary, k)
% xrange: a vector of length n with  equally spaced values x1 .. xn
% trange: a vector of length m with  equally spaced value t1 .. tm
% u_inital: a vector of length n with the initial conditions f(x1) ...
%               f(xn)
% u0_boundary: a vector of length m with the boundary conditions u0(t1) ..
%               u0(tm)
% uL_boundary: a vector of length m with the boundary conditions
%               uL(t1) .. uL(tm)
% k: constant from the heat 
u = 0;
xl = length(xrange);
deltax = xrange(xl) / (xl - 1);
tl = length(trange);
deltat = trange(tl) / (tl - 1);

u = zeros(xl, tl);
u(:,1) = u_initial;
u(1,:) = u0_boundary;
u(xl, :) = uL_boundary;
alpha = k*(deltat / deltax^2);
if(alpha < 0.5)    
    for j=1:tl -1
        for i=2:xl-1
            u(i, j+1) = u(i, j) + alpha*(u(i+1,j)-2*u(i,j)+u(i-1,j));
        end
    end
else
    error('Alpha nicht < 0.5');
end
end

