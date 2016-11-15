function [cropped_img_cl,cropped_img_gs,cropped_img_mask,border] = ...
    calculate_border_task1_solution(path_img, crop_factor, sigma)

%% This function does the following:
% 1) reads the picture stored at 'path_img' using imread.m and displays it
%    using imshow.m
% 2) converts the color picture into a grey-scale picture using rgb2gray.m
%    and shows it
% 3) cuts away the sides of the grey-scale image, the fraction is defined by
%    'crop_factor'
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
% Example: [cr_img_cl,cr_img_gs,cr_img_mask,border] = calculate_border('B1067.png', 0.1, 5);
% Date: March, 15, 2015; RK

%% 1) Read and show image
I1 = imread(path_img);
subplot(2,3,1),imshow(I1), title('Original image');

%% 2) Convert to grey scale
IG1=rgb2gray(I1);
subplot(2,3,2), imshow(IG1), title('Gray Scale Image');

%% 3) Cutt away the given percentage on each side, e.g. crop_factor = 0.1;
si = size(IG1);
xrange = int64([crop_factor*si(1):(1-crop_factor)*si(1)]);
yrange = int64([crop_factor*si(2):(1-crop_factor)*si(2)]);

mask = false(si);
mask(xrange,yrange) = true;

I2 = I1(xrange,yrange,:);
IG2 = IG1(xrange,yrange);
hold on
visboundaries(mask,'Color','b');
hold off
subplot(2,3,3), imshow(IG2), title('Cropped Image');

%% 4) Filter using a Gaussian Filter with a high enough sigma to blur
IG3 = imgaussfilt(IG2,sigma);
subplot(2,3,4), imshow(IG3), title('Gaussian Filter');

%% 5) Convert to binary picture using Otsu's threshold method 
level = graythresh(IG3);
IG4 = im2bw(IG3,level);
subplot(2,3,5), imshow(IG4), title('Otsu Binary Image');

%% 6) Transform logical IG4 into numeric values, fill holes in the image and
%     keep only the largest area
IG5 = uint8(-IG4+1);
IG6 = logical(imfill(IG5,'holes'));
IG7 = bwareafilt(IG6,1);

subplot(2,3,6), imshow(IG7), title('Filled Image and Contour');

%% 7) Compute the boundaries and plot them
boundaries = bwboundaries(IG7);
b = boundaries{1};

% Alternative mehtod
% bw = activecontour(IG7, IG7, 200, 'edge');
% hold on
% visboundaries(bw,'Color','g');
% hold off

hold on
plot(b(:,2),b(:,1),'g','LineWidth',3);
hold off

%% Define output

cropped_img_cl = I2;
cropped_img_gs = IG2;
cropped_img_mask = IG7;
border = b;

end
