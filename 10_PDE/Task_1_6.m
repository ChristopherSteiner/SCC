L = 1;
c = 1;
for n=1:40    
    fun = @(x) (x/L).*(1-x/L).*sin((n.*pi.*x)/L);
    fun2 = @(x) (x/L).^2.*(1-x/L).*sin((n.*pi.*x)/L);
    a(n) = 2/L * integral(fun,0, L);
    b(n) = 2/(n.*pi.*c) * integral(fun2, 0, L);
end

u = zeros(100, 100);
t = linspace(0, 4);
x = linspace(0, L);
for ti=1:length(t)
    for xi=1:length(x)
        for n=1:40
            u(ti, xi) = u(ti, xi) + sin(n.*pi.*x(xi)/L) * (a(n) ...
                * cos(n*pi*c*ti/L)+b(n)*sin(n*pi*c*ti/L));
        end
    end
end

[X, Y] = meshgrid(x);
surf(X, Y, u);
title('Wave Equation');