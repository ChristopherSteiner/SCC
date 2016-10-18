function cluster_gdist(data)
%  Function which applies the the gauss distribution to the given dataset for each
%  k ? {2,3,4,5}, then selects the ’best’ of theses clusterings
% (with respect to the silhouette value), and finally plots the result

[data_size1, data_size2] = size(data);
% the silhouette values per cluster size
silhouette_values = zeros(5, 1);
alphas = zeros(data_size1, 5);
for i=2:5
    gdist = fitgmdist(data, i);
    alphas(:, i) = cluster(gdist, data);
    silhouette_values(i) = get_silhouette_value(data, alphas(:, i));
end
[m, in] = max(silhouette_values);
plot_clusters(data, alphas(:, in));
end

