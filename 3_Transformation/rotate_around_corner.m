% Roates an image by its upper left corner by an angle t
function [ result ] = rotate_around_corner(source, t )
    x_size = size(source, 1);
    y_size = size(source, 2);
    delta = ceil(sqrt(x_size^2 + y_size^2));    
    moved = move_image(source, delta, delta);
    result = ones(delta * 2, delta * 2, 3);
    %result(1:size(moved, 1), 1:size(moved, 2), :) = moved;
    
    trans_matrix = [1 0 delta; 0 1 delta; 0 0 1];
    rotation_matrix = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];
    trans_matrix_b = [1 0 -delta; 0 1 -delta; 0 0 1];   
    matrix_around_middle = trans_matrix * rotation_matrix * trans_matrix_b;
    % Take the inverse of the rotation matrix to turn the image in the
    % right direction. (counter clockwise)
    matrix_around_middle_inv = inv(matrix_around_middle);
    for x=1:size(result, 1)
       for y=1:size(result, 2)
           oldPoints = matrix_around_middle_inv * [x; y; 1];
           oldX = round(oldPoints(1));
           oldY = round(oldPoints(2));
           if(oldX > 0 && oldY > 0)
               if(oldX > size(moved, 1) || oldY > size(moved, 2))
                    result(x, y, :) = 1;
               else
                    result(x, y, :) = moved(oldX, oldY, :);   
               end
           end
       end
    end
end

