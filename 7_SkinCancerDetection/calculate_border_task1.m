function [cropped_img_cl,cropped_img_gs,cropped_img_mask,border] = ...
    calculate_border_task1(path_img, crop_factor, sigma)

%% This function does the following:
% 1) reads the picture stored at 'path_img' using imread.m and displays it
%    using imshow.m
% 2) converts the color picture into a grey-scale picture using rgb2gray.m
%    and shows it
% 3) cuts away the sides of the grey-scale image, the fraction is defined by
%    'crop_factor' and shows it
% 4) blurs the picture using a Gaussian filter (using imgaussfilt.m) with
%    'sigma'; the larger sigma, the more the image gets blurred and finer
%    contours disappear; this is necessary to get rid of noise and unwanted
%    structures like hairs
% 5) uses Otsu's method to turn the filtered grey-scale image into a binary
%    image (using greythres.m and im2bw.m)
% 6) uses imfill.m to fill holes in the binary picture an bwareafilt.m to
%    keep only the region with the largest area
% 7) uses bwboundaries.m to calculate the border of the identified are and
%    plots everything
%
% Input :  path_img         : path to color image (string)
%          crop_factor      : percentage that should be cut away from 
%                             image (e.g. 0.1 means 10%)
%          sigma            : used for the Gaussian filter to blur the image
%                             (e.g. 5) in imgaussfilt.m
% Output : cropped_img_cl  : cropped color image (sides are cut away)
%          cropped_img_gs  : cropped grey scale image
%          cropped_img_mask: logical array with mask of the lesion, i.e.
%                            every pixel within the lesion has a value of 1, 
%                            every pixel outside the lesion has a value of 0
%          border          : array with x and y coordinates of the boundaries
%                            of the lesion
% Remarks: none
% Example: [cr_img_cl,cr_img_gs,cr_img_mask,border] = calculate_border_task1('B1067.png', 0.1, 5);
% Date: March, 15, 2015; RK

%% 1) Read image in a subplot(2,3,1) using imread.m and imshow.m
%     and show in a subplot(2,3,1)

I = imread(path_img);
<<<<<<< HEAD
[x, y] = size(I);
cropped_img_cl = I(uint16(x*crop_factor):uint16(end-x*crop_factor), ...
    uint16(y*crop_factor):uint16(end-y*crop_factor));
%subplot(2,3,1);
%imshow(I);
%title('Original Image');
=======
[x1, y1, ~] = size(I);
I_cl_cropped = I(uint16(x1*crop_factor):uint16(end-x1*crop_factor), ...
    uint16(y1*crop_factor):uint16(end-y1*crop_factor), :);
cropped_img_cl = I_cl_cropped;
subplot(2,3,1);
imshow(I);
title('Original Image');
>>>>>>> origin/master

%% 2) Convert to grey scale using rgb2gray.m 
%     and show in a subplot(2,3,2)

I_grey = rgb2gray(I);
%subplot(2,3,2);
%imshow(I_grey);
%title('Greyscale Image');

%% 3) Cutt away the given percentage on each side, e.g. crop_factor = 0.1,
%     and show in a subplot(2,3,3)

[grey_x, grey_y] = size(I_grey);
I_cropped = I_grey(uint16(grey_x*crop_factor):uint16(end-grey_x*crop_factor), ...
    uint16(grey_y*crop_factor):uint16(end-grey_y*crop_factor));
cropped_img_gs = I_cropped;
%subplot(2,3,3);
%imshow(I_cropped);
%title('Cropped Image');

%% 4) Filter using a Gaussian Filter with imgaussfilt.m and a high enough sigma to blur
%     and show in a subplot(2,3,4)

I_gauss = imgaussfilt(I_cropped, sigma);
%subplot(2,3,4);
%imshow(I_gauss);
%title('Gaussfilter Image');

%% 5) Convert to binary picture using Otsu's threshold method using greythres.m and im2bw.m
%     and show in a subplot(2,3,5)

level = graythresh(I_gauss);
I_otsu = im2bw(I_gauss, level);
%subplot(2,3,5)
%imshow(I_otsu);
title('Otsu threshhold image');

%% 6) Transform logical IG4 into numeric values, fill holes in the image and keep only the largest area
%     using imfill.m and bwareafilt.m 
%     and show in a subplot(2,3,6)
I_filled = imfill(uint8(~I_otsu));
I_filled = bwareafilt(logical(I_filled), 1);
cropped_img_mask = I_filled;
%subplot(2,3,6);
%imshow(I_filled);
%title('Filled holes');

%% 7) Compute the boundaries using bwboundaries.m
%     and plot them into the same subplot(2,3,6)

bounds = bwboundaries(I_filled);
border = bounds{1};
%hold on 
%plot(border(:,2), border(:,1), 'g', 'LineWidth', 3)
%hold off

end
