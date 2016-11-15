function [ vec_transformed, vec_compressed ] ...
    = Compress_PCA_vector( vec, m, V_eigen )
%Inputs:
% vec = a column vector representing a data point
% m = a column vector representing the mean vector
% V_eigen = a matrix whose columns represent eigenvectors
%Outputs:
% Vec_transformed: a column vector representing the coordinates of the
% transformed vector denoted by q on the slides
% Vec_compressed: a column vector4 representing the final result of the pca
% operations

% sub mean
vec_adjusted = vec - m;
vec_transformed = V_eigen' * vec_adjusted;
vec_compressed = V_eigen*vec_transformed;
% add back mean
vec_compressed = vec_compressed + m;
end

