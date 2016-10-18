I = (double(imread('Pics/moon.jpg'))./255);
I_grey = rgb2gray(I);
%V = GrayscaleImageToVector(I_grey);

% Test of GrayscaleImageToVecotr
GrayscaleImageToVector([1 2 3; 4 5 6;])

% Test of VectorToGrayscaleImage
VectorToGrayscaleImage([1;4;2;5;3;6],2,3)