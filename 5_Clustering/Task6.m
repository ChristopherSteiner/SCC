I = (double(imread('Pics/moon.jpg'))./255);
I_grey = rgb2gray(I);
I_rows = size(I_grey, 1);
I_columns = size(I_grey, 2);
V = GrayscaleImageToVector(I_grey);
alpha = kmeans(V, 2);
V(alpha == 1, :) = 0;
V(alpha == 2, :) = 1;
I_grey = VectorToGrayscaleImage(V, I_rows, I_columns); 
imshow(I_grey);


% Test of GrayscaleImageToVecotr
%GrayscaleImageToVector([1 2 3; 4 5 6;])

% Test of VectorToGrayscaleImage
%VectorToGrayscaleImage([1;4;2;5;3;6],2,3)