% Task 1.4
syms x y;
u1 = -sin(x.^2+(1./y.^2));

j = jacobian(x.^2+1./y.^2, [x y]);

pde = @(x, y) 1./x.*(u1.*j(1))+y.^3.*(u1.*matlabFunction(j(2)));

x = linspace(-3,3);
y = linspace(1,5);

[X,Y] = meshgrid(x,y);
figure(1)
hold on

surf(X, Y, pde(X,Y));