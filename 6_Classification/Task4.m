%Task 4
nonskin = zeros(10000,1);
skin = ones(10000, 1);

I = double(imread('Pics/test.png'))./255;
[x, y, ~] = size(I);
M = rgbImage2Matrix(I);

sv = svmtrain([skindata; nonskindata],[skin;nonskin])
svc = svmclassify(sv, M);

% unable to proceed because of the following error
% An error was encountered during classification.
% Requested 2190x943200 (7.7GB) array exceeds maximum array size preference. Creation of arrays
% greater than this limit may take a long time and cause MATLAB to become unresponsive. See array
% size limit or preference panel for more information.