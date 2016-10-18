function [ val ] = get_silhouette_value(X, a)
% val = value of the single clusters 
% x = the dataset
% a = cluster indeces vector
cluster_count = max(a);
s = silhouette(X, a);
% A vector with the mean per cluster
cluster_mean = zeros(cluster_count);
for i=1:cluster_count
    cluster_mean(i) = mean(s(a == i));
end
val = mean(cluster_mean);
end

