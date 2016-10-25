function [ M ] = rgbImage2Matrix(I)
%Converts the input image I to a matrix 
M = reshape(I, size(I, 1) * size(I, 2), 3);
end

