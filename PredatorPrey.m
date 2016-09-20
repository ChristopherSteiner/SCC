%1.5
g1 =  0.5;
g2 = 0.8;
g3 = 0.008;
t = 0:40;
y0 = [50; 30];

f = @(t, y) [g1 * y(1) - g3 * y(1) * y(2); -g2*y(2)+g3*y(1)*y(2)];
[t, y] = ode45(f, t, y0);
plot(t, y(:,1), t, y(:,2), t, y(:,2)./y(:,1).*100), legend('Prey', 'Predator', 'Predator to Pray factor in %');

% With increasing rate of preys the amount of predators is also increasing.
% Which after sometime leads to a decrease in prey, which causes a lot of
% predators to starve. And with only a few predators left the the prey
% population starts to increase again. Which leads finally to a circle.