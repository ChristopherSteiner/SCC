%% This script does the following:
% 1) calls the function calculate_border_task1.m
% 2) calculates the centroid (center of mass) and bounding box
%    with regionprops.m (which is a standard MATLAB function, see manual
%    for details)
% 3) shows the picture with the centroid and the bounding box

clear all
close all

%% Define path
path = '';
img ='B496a.png';
path_img = [path '\' img];
fprintf('Processed Picture: %s\n',img);
    
%% Step 1: Read Image and calculate border of lesion

% 10% is cut away from each side of the image, then the image is blurred using
% a Gaussian filter with sigmaa 5. Then the contour is of the lesion is
% calculated. Output is the cropped color image, the cropped grey scale
% image and the borders of the contour.

[cropped_img_cl,cropped_img_gs,cropped_img_mask,border] = ...
    calculate_border_task1(img, 0.1, 5);

%% Step 2: Calculate the centroid (center of mass) and bounding box
% regionprops.m is a standard MATLAB function, see manual for details
IGA = cropped_img_cl;
IGB = uint8(cropped_img_mask);
IGC = cropped_img_gs;

% ... HERE COMES YOUR CODE ...

%% Step 3: show the cropped RGB picture with the centroid and the bounding box

figure(2)
imshow(IGA)
title('Bounding Box');
hold on;

% ... HERE COMES YOUR CODE ...

hold off;
    
