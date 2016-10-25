function [ a ] = classify_nearestneighbor(A,M,k)
% Uses the nearest neighbor algorithm with a gaussian mixture model
% A = input matrix of distributed points
% M = matrix of not yet classified points
% k = amount of classes
d = size(A,2);
N = size(A,1)/k;
pd = zeros(size(M, 1), k);
for i=1:k
    T = A((i-1)*N+1:N*i, :);
    for j=1:d        
        means_matrix(i,j) = mean(T(:, j));
    end    
    cov_mat = cov(T);
    pd(:, i) = mvnpdf(M, means_matrix(i,:), cov_mat);
end
for i=1:size(M,1)
    [~, a(i)] = max(pd(i, :));
end
end

