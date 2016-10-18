D = [1 2; 12 4; 4 8; 2 3; 5 7; 3 4; 2 2; 6 9; 10 4];
%plot(D(:,1), D(:,2), 'bo');
alpha = kmeans(D,3);
P1 = D(alpha == 1,:);
P2 = D(alpha == 2,:);
P3 = D(alpha == 3,:);
hold off;
hold on;
% plot(P1(:,1), P1(:,2), 'bo');
% plot(P2(:,1), P2(:,2), 'go');
% plot(P3(:,1), P3(:,2), 'ro');

%Doppelklick der Files in Datasets um diese zu laden!
%plot_clusters(D, alpha);
get_silhouette_value(X1, alpha1)
get_silhouette_value(X2, alpha2)

cluster_kmeans(data10)