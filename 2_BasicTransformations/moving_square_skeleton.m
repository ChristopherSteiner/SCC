function  moving_square()
%warmup example: point moving along diagonal line

x_step = 0.1; %increment of x-coordinate in one step
y_step = 0.05; %increment of y-coordinate in one step
n = 1000; %number of steps

cs_start = [3;4];  %coordinates of the center of the square (arbitrarily chosen value)
side_len = 8; %side length of the squaere (arbitrarily chosen value)

%determine the coordinates of the four vertices s1, s2, s3, s4 of the
%square 
s1_start = cs_start + [side_len/2; side_len/2];
s2_start = cs_start + [-side_len/2; side_len/2];
s3_start = cs_start + [-side_len/2; -side_len/2];
s4_start = cs_start + [side_len/2; -side_len/2] 

%initialization (from now an, use homogeneous coordinates)
cs = [cs_start; 1]; 
s1 = [s1_start; 1];
s2 = [s2_start; 1]; 
s3 = [s3_start; 1];
s4 = [s4_start; 1];

trans_matrix = [1 0 0.1; 0 1 0.05; 0 0 1];
for i = 1:n
   
    cs = trans_matrix * cs;
    s1 = trans_matrix * s1;
    s2 = trans_matrix * s2
    s3 = trans_matrix * s3;
    s4 = trans_matrix * s4;    
    
    %update cs and s1, s2, s3, s4    
    clf; %delete previous plot
    hold on; %retain all upcoming plots in this iteration of the loop    
    plot(cs(1), cs(2), '*');
    plot([s1(1) s2(1) s3(1) s4(1) s1(1)], [s1(2) s2(2) s3(2) s4(2) s1(2)], 'r');
    axis([-12, 120, -12, 120]); %keep axis limits (to avoid disturbing visual effects) 
    pause(0.0005); %pauses for 0.0005 sec    
end

