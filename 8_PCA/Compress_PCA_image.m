function [ I_compressed, vec_transformed ] = ...
    Compress_PCA_image( I, n_eigenvectors, V, mean )
%Input
% I = an image
% n_eigenvectors = the number of considered eigenvectors,
% V = a matrix whose columns represent eigenvectors,
% mean = a matrix representing the mean face,
%Ouptut
% I_compressed: the image resulting from applying the pca algorithm
% vec_transformed: a column vector representing the coordinates of the
% transformed vector 
[x,y] = size(I);
vec = Transform_image_to_column_vector(I);
mean_vec = Transform_image_to_column_vector(mean);
[ vec_transformed, vec_compressed ] = ...
    Compress_PCA_vector(vec, mean_vec, V(:, 1:n_eigenvectors));
I_compressed = Transform_vector_to_image(vec_compressed, x, y);

end

