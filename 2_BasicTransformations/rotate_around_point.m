function [ phi_new ] = rotate_around_point( phi_old, a, b, Phi  )
%ROTATE_AROUND Summary of this function goes here
%   Detailed explanation goes here
    trans_matrix = [1 0 a; 0 1 b; 0 0 1];
    rotation_matrix = [cos(Phi) -sin(Phi) 0; sin(Phi) cosd(Phi) 0; 0 0 1];
    trans_matrix_b = [1 0 -a; 0 1 -b; 0 0 1];
    
    phi_new = trans_matrix *  rotation_matrix * trans_matrix_b * phi_old;

end

