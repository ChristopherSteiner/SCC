function [m] = Get_mean(data_mat)
% takes as input a matrix whose rows represent data points, 
% and outputs a row vector whose
% ith component is the mean over the ith components of all data points.
    m = mean(data_mat);
end

