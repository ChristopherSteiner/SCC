function [ intensity ] = get_intensity(Im,i,j)
% Im = Source Image
% i = Point i
% j = Point j
% Returns wheter the given point is in the image and its intensity or 0
% (black)
x_size = size(Im, 1);
y_size = size(Im, 2);
if i < 1 || j < 1 || i > x_size || j > y_size
    intensity = 0;
else
    intensity = Im(i, j);
end
end

