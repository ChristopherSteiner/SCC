function [ p ] = rotate_around_point(pold, a, b, phi)
%pold = point to rotate
%a = x coordinate of rotation middle
%b = y coordinate of rotation middle
%phi = radian angle
trans_matrix = [1 0 a; 0 1 b; 0 0 1];
rotation_matrix = [cos(phi) -sin(phi) 0; sin(phi) cos(phi) 0; 0 0 1];
trans_matrix_b = [1 0 -a; 0 1 -b; 0 0 1];

p = trans_matrix * rotation_matrix * trans_matrix_b * pold;

end

