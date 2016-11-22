% Task 1.3
syms x y
urf = matlabFunction(((x.^2-1)+(y.^2-4)+(x.^2-1)*(y.^2-4)) / (x.^2+y.^2+1).^2);
grad = jacobian(((x.^2-1)+(y.^2-4)+(x.^2-1)*(y.^2-4)) / (x.^2+y.^2+1).^2)
f1 = matlabFunction(grad(1));
f2 = matlabFunction(grad(2));

x = -pi :0.1: pi;

[X,Y] = meshgrid(x);
figure(1)
hold on
surf(X, Y, urf(X,Y));
quiver3(X,Y,urf(X,Y),f1(X,Y),f2(X,Y),f1(X,Y).^2+f2(X,Y).^2);