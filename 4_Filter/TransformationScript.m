I = (double(imread('sunflowers.png'))./255);
F = 1/9 * ones(3);
R = myfilter(rgb2gray(I), F);
subplot(1, 2, 1)
imshow(I)
subplot(1, 2, 2)
imshow(R)
