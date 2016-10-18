function [ V ] = GrayscaleImageToVector(I)
% I = A grayscale image
% Constructs a vector by concatenating the clolumns of I
[row_count, column_count] = size(I);
V = reshape(I, [row_count*column_count, 1]);
end

