%% This script does the following:
% 1) calls the function calculate_border_task1.m
% 2) calculates the centroid (center of mass) and bounding box
%    with regionprops.m (which is a standard MATLAB function, see manual
%    for details)
% 3) shows the cropped RGB picture with the centroid and the bounding box

clear all
close all

%% Define path
path = 'C:\Users\phili\Documents\GitHub\SCC\7_SkinCancerDetection';
img ='B496a.png';
path_img = [path '\' img];
fprintf('Processed Picture: %s\n',img);
    
%% Step 1: Read Image and calculate border of lesion
%          by calling calculate_border_task1.m

% 10% is cut away from each side of the image, then the image is blurred using
% a Gaussian filter with sigmaa 5. Then the contour is of the lesion is
% calculated. Output is the cropped color image, the cropped grey scale
% image and the borders of the contour.

[cropped_img_cl,cropped_img_gs,cropped_img_mask,border] = calculate_border_task1_solution(path_img, 0.1, 10);
    
%% Step 2: Calculate the centroid (center of mass) and bounding box
% regionprops.m is a standard MATLAB function, see manual for details
IGA = cropped_img_cl;
IGB = uint8(cropped_img_mask);
IGC = cropped_img_gs;

s = regionprops(IGB, IGC, {'Centroid','PixelValues','BoundingBox'});

%% Step 3: show the cropped RGB picture with the centroid and the bounding box
% use plot for the coordinates of the centroid and use rectangle.m to plot 
% the bounging box

figure(2)
imshow(IGA)
title('Bounding Box');
hold on;
plot(s(1).Centroid(1), s(1).Centroid(2), 'go','LineWidth',3);
rectangle('Position', s(1).BoundingBox, ...
    'EdgeColor','y');
plot(border(:,2),border(:,1),'g','LineWidth',3);
hold off;
    
