function cluster_kmeans(data)
%  which applies the k-means-algorithm to the given dataset for each
%  k ? {2,3,4,5}, then selects the ’best’ of theses clusterings
% (with respect to the silhouette value), and finally plots the result

% the silhouette values per cluster size
silhouette_values = 0;
alphas = 0;
for i=1:4
    alpha(i) = kmeans(data,i+1);
    silhouete_values(i) = get_silhouette_value(data, alpha);
end
[m, in] = max(silhouete_values);
plot_clusters(data, alpha(in));
end

