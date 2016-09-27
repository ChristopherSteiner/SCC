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
plot(t3, y3(:,1), t3, y3(:,2)), legend('y1', 'y2');

% y1' = sin(t)*exp(t)-y2
% y2' = y1 * y2
f4 = @(t, y) [sin(t)*exp(t)-y(2); y(1) * y(2)];
[t4, y4] = ode45(f4, [a, b], [1; 0]);
plot(t4, y4(:,1), t4, y4(:,2)), legend('y1','y2');