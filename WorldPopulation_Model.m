data_t = [1800,1850,1900,1950:5:2015];
data_p = [1,1.262,1.650,2.525,2.758,3.018,3.322,3.682,4.061,4.440,4.853,5.310,5.735,6.127,6.520,6.930,7.349];
t0 = 1960;
y0 = 3.018;
b_m = 0.02;
g = 0.029;
p = 2.941*10^-3;
f = @(t) y0*exp((b_m)*(t-t0));
f1 = @(t, y) b_m*y;
f2 = @(t, y) (g-p*y)*y;
[t, y] = ode45(f1, [1960 2050], y0);
[t2, y2] = ode45(f2, [1960 2050], y0);
grid on;
hold on;
plot(data_t, f(data_t), 'b', data_t, data_p, 'ro', t, y, 'g', t2, y2, 'b');
legend('Exponential growth exact', 'Estimated World Population', 'Exponential Growth ode45', 'Verhulst ode45');
clf('reset');

%1.4
for g = 0.01:0.01:0.05
    for p = 0.001:0.001:0.005  
        [t3, y3] = ode45(@(t, y) (g-p*y)*y, [1960 2050], y0);        
        plot(t3, y3);
        hold on;        
    end
end