%rotates an image by an angle of t around its center using backward mapping
% SampleCall : imagesc(rotate_around_center(
% double(imread('sunflowers.jpg'))./255, pi/4))
function [ result ] = rotate_around_center( source, t)
    xMax = size(source, 1);
    yMax = size(source, 2);
    xCenter = round(xMax/2);
    yCenter = round(yMax/2);
    trans_matrix = [1 0 xCenter; 0 1 yCenter; 0 0 1];
    rotation_matrix = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];
    trans_matrix_b = [1 0 -xCenter; 0 1 -yCenter; 0 0 1];   
    matrix_around_middle = trans_matrix * rotation_matrix * trans_matrix_b;
    % Take the inverse of the rotation matrix to turn the image in the
    % right direction. (counter clockwise)
    matrix_around_middle_inv = inv(matrix_around_middle);
    result = ones(xMax, yMax, 3);
    for x=1:xMax
       for y=1:yMax
           oldPoints = matrix_around_middle_inv * [x; y; 1];
           oldX = round(oldPoints(1));
           oldY = round(oldPoints(2));
           if(oldX > 0 && oldY > 0)
               if(oldX > size(source, 1) || oldY > size(source, 2))
                    result(x, y, :) = 1;
               else
                    result(x, y, :) = source(oldX, oldY, :);   
               end
           end
       end
    end
end

