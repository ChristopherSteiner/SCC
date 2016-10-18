function cluster_kmeans(data)
%  which applies the k-means-algorithm to the given dataset for each
%  k ? {2,3,4,5}, then selects the ’best’ of theses clusterings
% (with respect to the silhouette value), and finally plots the result

[data_size1, data_size2] = size(data);
% the silhouette values per cluster size
silhouette_values = zeros(5, 1);
alphas = zeros(data_size1, 5);
for i=2:5
    alphas(:, i) = kmeans(data,i);
    silhouete_values(i) = get_silhouette_value(data, alphas(:, i));
end
[m, in] = max(silhouete_values);
plot_clusters(data, alphas(:, in));
end

