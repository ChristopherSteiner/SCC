%Moves each pixel of the source image by delta x in x direction and by
%delta y in y direction
%Sample Call in Task3.m
function [ result ] = move_image(source, delta_x, delta_y)
    size_x = size(source, 1);
    size_y = size(source, 2);
    result = ones(size_x + delta_x, size_y + delta_y, 3);
    move_matrix = [1 0 delta_x; 0 1 delta_y; 0 0 1];
    for x=1:size_x
       for y=1:size_y
           new_point = move_matrix * [x; y; 1];           
           result(new_point(1), new_point(2), :) = source(x, y, :);
       end       
    end
end

