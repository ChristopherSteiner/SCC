function [ R ] = myfilter( Im, F )
% Im = Grayscale Image
% F = a 3x3 matrix
x_size = size(Im, 1);
y_size = size(Im, 2);
filter_size = size(F, 1);
R = zeros(x_size, y_size);
%Iterate through every pixel in the image
for i=1:x_size
   for j=1:y_size       
       % Iterate through the filter
       for k = -1:1
          for l = -1:1
              R(i,j) = R(i,j) + get_intensity(Im, i+k, j+l)*F(k+2,l+2);
          end
       end
   end
end
end

