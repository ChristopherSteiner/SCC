L = 1;
k = 1;
for n=1:40    
    fun = @(x) 4.*(x/L).*(1-x/L).*sin((n.*pi.*x)/L);
    b(n) = 2 * integral(fun,0, 1);
end

u = zeros(100, 100);
t = linspace(0, 0.25);
x = linspace(0, 1);
for ti=1:length(t)
    for xi=1:length(x)
        for n=1:40
            u(ti, xi) = u(ti, xi) + b(n) .* sin(n.*pi.*x(xi)/L).*exp(-((n^2.*pi^2.*k/L^2).*t(ti)));
        end
    end
end

[X, Y] = meshgrid(x);
surf(X, Y, u);
title('Heat Conduction');