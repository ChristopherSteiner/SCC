I = (double(imread('sunflowers.png'))./255);
IMonroe = (double(imread('monroe.png'))./255);
IPlane = (double(imread('airplane.png'))./255);
ICoins = (double(imread('coins.png'))./255);
IJetski = (double(imread('jetski.png'))./255);
F = 1/9 * ones(3);
R = myfilter(rgb2gray(I), F);
imshowpair(I, R, 'montage')
%2
%a
Fa = [0 0 0; 0 1 0; 0 0 0] - 1/9 * ones(3) + [0 0 0; 0 1 0; 0 0 0];
imshowpair(IMonroe, imfilter(IMonroe, Fa), 'montage')
%b
imshowpair(IPlane, medfilt2(rgb2gray(IPlane)), 'montage')
%c
GH1 = [-1 0 1;-1 0 1;-1 0 1];
GV1 = [-1 -1 -1; 0 0 0; 1 1 1];
GH2 = [1 0 -1;1 0 -1;1 0 -1];
GV2 = [1 1 1; 0 0 0; -1 -1 -1];

G1 = imfilter(rgb2gray(ICoins),GH1);
G2 = imfilter(rgb2gray(ICoins),GV1);
G3 = imfilter(rgb2gray(ICoins),GH2);
G4 = imfilter(rgb2gray(ICoins),GV2);

G = sqrt((G1.^2+G2.^2+G3.^2+G4.^2));
imshowpair(ICoins, G, 'montage')

%3
F3 = zeros(15);
F3(8, :) = 1/15;
imshowpair(IJetski, imfilter(IJetski, F3), 'montage');
