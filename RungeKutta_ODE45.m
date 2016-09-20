% y' = t;
a = 0;
b = 5;
y0 = 1;
f = @(t, y) t;
[t1, y1] = ode45(f, [a, b], y0);
plot(t1, y1);

% y' = y;
f2 = @(t, y) y;
[t2, y2] = ode45(f2, [a, b], y0);
plot(t2, y2);

% y1' = y2 * t; 
% y2' = y1 * t;
f3 = @(t, y) [y(2)*t; y(1)*t];
[t3, y3] = ode45(f3, [a, b], [1; 0]);
plot(t3, y3);