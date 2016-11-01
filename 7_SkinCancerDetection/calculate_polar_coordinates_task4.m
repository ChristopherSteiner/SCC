function [r, alpha, r_sort, alpha_sort, alpha_index, r_bin, alpha_bin] = ...
    calculate_polar_coordinates_task4(x_center, y_center, border)

% This function does the following:
% 1) calculates polar coordinates (i.e. radius r, angle alpha) of the 
%    boundaries of an area with the centroid defined by (x_center,y_center)
%    and the border defined by an array of cartesian x and y coordinates
% 2) sorts the polar coordinates in ascending order with respect to alpha
% 3) averages the radii over bins of 1 deg in alpha (i.e. 360 bins)
%
% Input :  x_center         : x coordinate of centroid (center of mass)
%          y_center         : y coordinate of centroid (center of mass)
%          border           : array of size (n,2) with x and y coordinates
%                             of the border in its columns
% Output : r                : vector of size (n,1) containing the radii 
%          alpha            : vector of size (n,1) containing the angles
%          r_sort           : sorted r with respect to increasing angles
%                             alpha
%          alpha_sort       : vector with sorted angles in increasng order
%          alpha_index      : vector with index of alpha_sort in the 
%                             unsorted vecotr alpha 
%          r_bin            : vector of size (1, 360) containing the
%                             averaged radii over angle bins of 1 deg
%          alpha_bin        : vector of size (1, 360) containing the
%                             angle bins of 1 deg in radians, ranging from
%                             -pi to pi
% Remarks: Since images are read as a matrix with the first pixel having
%          the coordinates (1,1) in the upper left corner (i.e. row index 
%          appears on the y axis, column index on the x axis), coordinates x
%          and y in the border are swapped 
% Example: [r, alpha, r_sort, alpha_sort, alpha_index, r_bin, alpha_bin] = ...
%          calculate_polar_coordinates(xc, yc, b);
% Date: October, 23, 2016; RK

%% 1) Calculate polar coordinates
r = sqrt((border(:,2)-x_center).^2 + (border(:,1)-y_center).^2);
alpha = atan2(border(:,2)-x_center,border(:,1)-y_center);

%% 2) Sort angles in ascending order, radii accordingly
[alpha_sort, alpha_index] = sort(alpha);
r_sort=r(alpha_index);

%% 3) Average the radii in bins of 1 degree in radians
stepsize=pi/180;
theta = -pi:stepsize:pi;
n = length(theta)-1;
r_bin=zeros(1,n);
alpha_bin=zeros(1,n);

for i = 1:n
    ind=(theta(i) <= alpha_sort) &  (alpha_sort <= theta(i+1));
    r_bin(i) = mean(r_sort(ind));
    alpha_bin(i) = theta(i);
end

end
