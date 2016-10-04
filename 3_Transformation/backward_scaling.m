%scales the source image by a factor a
%using backward mapping
% Sample call: imagesc(backward_scaling(
% double(imread('sunflowers.jpg'))./255, 1.2))
function [ result ] = backward_scaling( source, a)
    xMaxNew = ceil(size(source, 1) * a);
    yMaxNew = ceil(size(source, 2) * a);
    scaleMatrix = [1/a 0 0; 0 1/a 0; 0 0 1];
    for x=1:xMaxNew
       for y=1:yMaxNew
           oldPoints = scaleMatrix*[x; y; 1];
           oldX = round(oldPoints(1));
           oldY = round(oldPoints(2));
           if(oldX > size(source, 1) || oldY > size(source, 2))
                result(x, y, :) = 0;
           else
                result(x, y, :)= source(oldX, oldY, :);
           end
       end
    end
end

