% Task 1.1

f1 = @(x, y) x.^2 - y.^2;
f2 = @(x, y) x.*y.^2.*(sin(x)+sin(y));

x = -pi:0.1:pi;

[X, Y] = meshgrid(x);

r = f1(X, Y);
r2 = f2(X, Y);

figure(1)
surf(X, Y, r);

figure(2)
surf(X, Y, r2);