%Task 2c
I = (double(imread('coins.png'))./255);
F = 1/9 * ones(3);
R = myfilter(rgb2gray(I), F);
subplot(1, 2, 1)
imshow(R)

L = imfilter(rgb2gray(I),F);
subplot(1, 2, 2)


GH1 = [-1 0 1;-1 0 1;-1 0 1];
GV1 = [-1 -1 -1; 0 0 0; 1 1 1];
GH2 = [1 0 -1;1 0 -1;1 0 -1];
GV2 = [1 1 1; 0 0 0; -1 -1 -1];

G1 = imfilter(rgb2gray(I),GH1);
G2 = imfilter(rgb2gray(I),GV1);
G3 = imfilter(rgb2gray(I),GH2);
G4 = imfilter(rgb2gray(I),GV2);

G = sqrt((G1.^2+G2.^2+G3.^2+G4.^2));

imshow(G);