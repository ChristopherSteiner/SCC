function [sfa,sfa_major_axis,ind_major_axis,sfa_minor_axis,ind_minor_axis,asymmetry] = ...
    calculate_asymmetry_task4(r_bin, rel_diff, sfa_thresh)

% This function does the following:
% 1) For each radius r_i in r_bin, a value sfa_i is calculated. For this 
%    purpose, the length difference of each pair of radii in r_bin symmetric
%    to r_i is computed. If the length difference is less than rel_diff (e.g. 10%), sfa_i 
%    is increased by 1.
% 2) The radius r_i, that has the largest sfa_i is considered to be the major
%    axis of symmetry, the axis perpendicular to it is the minor asix of
%    symmetry.
% 3) If both axes have a sfa value of >= sfa_thresh (e.g. 140), then the lesion is symmetric
%    across both axes and the asymmetry value is 0. If the major axis has a
%    sfa >= 140 and the minor axis has a sfa < sfa_thresh (e.g. 140), then the lesion is
%    asymmetric across one axis and has a asymmetry value of 1. If both
%    axes have a sfa value < sfa_thresh (e.g. 140), then the lesion is asymmetric across both
%    axis and receives an asymmetry value of 2.
%
% Input :  r_bin           : averaged r-values from function
%                            calculate_polar_coordinates_task4
%          rel_diff        : value between 0 and 1, indicating the relative
%                            difference for the radii comparison (e.g. 0.1)
%          sfa_thresh      : threshold for the asymmetry score, e.g. 140
% Output : sfa             : vector with sfa_i values for all r_i 
%          sfa_major_axis  : sfa_i for major axis of symmetry
%          ind_major_axis  : corresponding index, i.e. 
%                            sfa(ind_major_axis)=sfa_major_axis
%          sfa_minor_axis  : sfa_i for minor axis of symmetry
%          ind_minor_axis  : corresponding index, i.e. 
%                            sfa(ind_minor_axis)=sfa_minor_axis
%          asymmetry       : asymmetry value (0,1 or 2)
% Remarks: none
% Example: [sfa,sfa_major_axis,ind_major_axis,sfa_minor_axis,ind_minor_axis,asymmetry] = ...
%    calculate_asymmetry_task4(r_bin);
% Date: October,23, 2016; RK

%% 1) Initialize sfa and compare adjacent radii, give a point if the 
%     relative difference is less than rel_diff 

n = length(r_bin);
sfa = zeros(1,n);
<<<<<<< HEAD

for i = 1:n
    for j = 1:n/2  
        
=======
for i = 1:n
    for j = 1:n/2
    if(abs(1-(rbin(i))/rbin(j)) > rel_diff)    
        sfa(i) = sfa(1)+1;  
    end
>>>>>>> origin/master
    end
end
%% 2) Find angle with highest score, this is the major symmetry axis
[sfa_major_axis,ind_major_axis] = max(sfa);

% perpendicular axis is the minor axis of symmetry

    % ... HERE COMES YOUR CODE ...  


%% 3) Calculate the asymmetry value

    % ... HERE COMES YOUR CODE ...  


end
