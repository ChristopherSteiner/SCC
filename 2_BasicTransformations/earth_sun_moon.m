function earth_sun1()
side_len = 2;
side_len_m = 1;
ce_start = [5; 0];
cm_start = [7; 2];
e1_start = ce_start + [side_len/2; side_len/2];
e2_start = ce_start + [-side_len/2; side_len/2];
e3_start = ce_start + [-side_len/2; -side_len/2];
e4_start = ce_start + [side_len/2; -side_len/2];
m1_start = cm_start + [side_len_m/2; side_len_m/2];
m2_start = cm_start + [-side_len_m/2; side_len_m/2];
m3_start = cm_start + [-side_len_m/2; -side_len_m/2];
m4_start = cm_start + [side_len_m/2; -side_len_m/2];

sun = [0; 0]; %coordinates of the sun

Phi_rotate = pi/360; %angle for earth orbiting the sun (arbitrarily chosen number)
n = 1000; %number of iterations

ce = [ce_start; 1];
e1 = [e1_start; 1];
e2 = [e2_start; 1]; 
e3 = [e3_start; 1];
e4 = [e4_start; 1];
cm = [cm_start; 1];
m1 = [m1_start; 1];
m2 = [m2_start; 1]; 
m3 = [m3_start; 1];
m4 = [m4_start; 1];

for i = 1:n
    %earth orbiting the sun
    ce = rotate_around_point(ce, sun(1), sun(2), Phi_rotate);
    [e1, e2, e3, e4] = rotate_tuple(e1, e2, e3, e4, sun(1), sun(2), Phi_rotate);
    [e1, e2, e3, e4] = rotate_tuple(e1, e2, e3, e4, ce(1), ce(2), Phi_rotate);
    cm = rotate_around_point(cm, sun(1), sun(2), Phi_rotate);
    cm = rotate_around_point(cm, ce(1), ce(2), Phi_rotate);    
    [m1, m2, m3, m4] = rotate_tuple(m1, m2, m3, m4, sun(1), sun(2), Phi_rotate);
    [m1, m2, m3, m4] = rotate_tuple(m1, m2, m3, m4, ce(1), ce(2), Phi_rotate);
    [m1, m2, m3, m4] = rotate_tuple(m1, m2, m3, m4, cm(1), cm(2), Phi_rotate);
    
    %plot
    clf; %delete previous plot
    hold on; %retain all upcoming plots in this iteration of the loop    
    plot(sun(1), sun(2), '*r');
    plot(ce(1), ce(2), '*b');
    plot([e1(1) e2(1) e3(1) e4(1) e1(1)], [e1(2) e2(2) e3(2) e4(2) e1(2)], 'r');
    plot(cm(1), cm(2), '*k');    
    plot([m1(1) m2(1) m3(1) m4(1) m1(1)], [m1(2) m2(2) m3(2) m4(2) m1(2)], 'k');
    axis([-10, 10, -10, 10]);
    pause(0.0005);   
    
end;

