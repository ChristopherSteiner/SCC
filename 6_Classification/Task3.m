%3b)
I = double(imread('Pics/test.png'))./255;
[x, y, ~] = size(I);
M = rgbImage2Matrix(I);
R1 = classify_nearestmean([nonskindata; skindata], M, 2)-1;
R2 = classify_nearestneighbor([nonskindata; skindata], M, 2)-1;
imshow(Matrix2grayImage(R1, x, y))
imshow(Matrix2grayImage(R2, x, y))