I = double(imread('sunflowers.jpg'))./255;
I = rotate_around_corner(I, pi/4);
imagesc(I);