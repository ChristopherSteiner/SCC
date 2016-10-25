function [ a ] = classify_nearestmean(A,M,k)
% Uses the nearest mean algorithm
% A = input matrix of distributed points
% M = matrix of not yet classified points
% k = amount of classes
d = size(A,2);
N = size(A,1)/k;
means_matrix = zeros(k, d);
for i=1:k
    T = A((i-1)*N+1:N*i, :);
    for j=1:d        
        means_matrix(i,j) = mean(T(:, j));
    end
end
dist_to_mean = zeros(k,1);
for i=1:size(M,1)
    for j=1:k        
        dist_to_mean(j) = distance(M(i,:)', means_matrix(j,:)');
    end
    [~, a(i)] = min(dist_to_mean);
end
end

