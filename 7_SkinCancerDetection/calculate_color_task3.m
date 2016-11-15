function [color_score, count, average_color_diff,variance] = ...
    calculate_color_task3(cropped_img_cl,cropped_img_mask,color_table,threshold,plot_image)

% This function does the following:
% 1) Write the RGB channels of the cropped colour image into separate
%    matrices
% 2) For each pixel inside the lesion, the euclidian distance to the
%    defined colors in color_table is calculated. The minimum distance decides,
%    which color the pixel is attributed to
% 3) For each color, that is present in a certain percentage of all the
%    inside pixels (as defined by threshold), the color score is increased by
%    1
% 4) Calculate the euclidian distance between the average pixel inside and
%    outside the lesion and write result in average_color_diff
% 5) Calculate the variance in R,G,B and write into the vector variance
%    using var.m
% 6) Plot histograms if required
%
% Input :  cropped_img_cl    : cropped color image as calculated by 
%                              calculate_border.m
%          cropped_img_mask  : mask of lesion as calculated by 
%                              calculate_border.m   
%          color_table       : (n,3) array of n colors, defined by its RGB colors
%          threshold         : between 0 and 1, defines the percentage of
%                              pixels that need to be present for each color
%                              to get a point
%          plot_image        : 0: no plots are generated
%                              1: plots are generated
% Output : color score       : value between 0 to n (each color present receives
%                              one point)
%          count             : percentage of pixels  for each color present
%                            : in color_table
%          average_color_diff: euclidian distance between the average pixel inside and
%                              outside the lesion
%          variance          : (3,1) vector with the variances in R,G,B
% Remarks: The results for the color score differ strongly, if the values
%          for the reference colors are changed. It would be necessary to look into
%          this more closely and als come up with additional measures, for instance
%          the euclidian distance betwenn the average pixel inside the lesion and
%          outside the lesion.
% Example: [color_score, count] = ...
%          calculate_color_task1(cropped_img_cl,cropped_img_mask,color_table,threshold,plot_image));
% Date: October,23, 2016; RK

%% 1) Extract RGB color channels from cropped_img_cl

R = double(cropped_img_cl(:,:,1));
G = double(cropped_img_cl(:,:,2));
B = double(cropped_img_cl(:,:,3));
color_score = 0;
count = zeros(length(color_table), 1);
variance = zeros(3,1);

%% 2) Calculate euclidian distance from the defined colors for each pixel
%     inside the lesion and count the closest pixels.

inside = find(cropped_img_mask);
outside = find(~cropped_img_mask);
for i=1:length(inside)
    for c=1:length(color_table)        
       val(c) = norm(color_table(c, :) - [R(inside(i)) G(inside(i)) B(inside(i))]);
    end   
   [~, colorIndex] = min(val);
   count(colorIndex) = count(colorIndex) + 1;
end
%% 3) For each color, that is represented in more than the percantage of
%     the pixels (defined by threshold), a point is given for the color score
color_sum = sum(count);
for c=1:length(color_table)  
    if(count(c)/color_sum > threshold)
        color_score = color_score + 1;
    end
end

%% 4) Calculate the euclidian distance between the average pixel inside and
%     outside the lesion

average_inside  = [mean(R(inside)),mean(G(inside)),mean(B(inside))];
average_outside = [mean(R(outside)),mean(G(outside)),mean(B(outside))];
average_color_diff = norm(average_inside - average_outside);

%% 5) Calculate the variance of the R,G,B channels inside the lesion using var.m

variance(1) = var(R(inside));
variance(2) = var(G(inside));
variance(3) = var(B(inside));

%% 6) Do plots if plot_image is set to 1
if (plot_image)
    nfigs = get(0,'Children');
    numfig = length(nfigs);
    figure(numfig+1)
    map_r = colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]);
    subplot(2,2,1), image(R), colorbar, title('Red Channel') ;
    subplot(2,2,2), imhist(R,map_r), title('Histogram All');
    subplot(2,2,3), imhist(R(inside),map_r), title('Histogram Inside');
    subplot(2,2,4), imhist(R(outside),map_r), title('Histogram Outside');
  
    figure(numfig+2)
    map_g = colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]);
    subplot(2,2,1), image(G), colorbar, title('Green Channel') ;
    subplot(2,2,2), imhist(G,map_g), title('Histogram All');
    subplot(2,2,3), imhist(G(inside),map_g), title('Histogram Inside');
    subplot(2,2,4), imhist(G(outside),map_g), title('Histogram Outside');
    
    figure(numfig+3)
    map_b = colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']);
    subplot(2,2,1), image(B), colorbar, title('Blue Channel') ;
    subplot(2,2,2), imhist(B,map_b), title('Histogram All');
    subplot(2,2,3), imhist(B(inside),map_b), title('Histogram Inside');
    subplot(2,2,4), imhist(B(outside),map_b), title('Histogram Outside');
end
    
end
