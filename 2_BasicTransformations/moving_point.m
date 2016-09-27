function  moving_point()
%warmup example: point moving along diagonal line

x_step = 0.1; %increment of x-coordinate in one step
y_step = 0.05; %increment of y-coordinate in one step
n = 1000; %number of steps

x_start = 0;
y_start = 0;

%initialization
x = x_start; 
y = y_start;

for i = 1:n
    x = x + x_step;
    y = y + y_step;
    
    %plot
    clf; %delete previous plot
    hold on; %retain all upcoming plots in this iteration of the loop
    plot(x,y,'*'); %plot current position 
    axis([-12, 120, -12, 120]); %keep axis limits (to avoid disturbing visual effects) 
    pause(0.0005); %pauses for 0.0005 sec

end

