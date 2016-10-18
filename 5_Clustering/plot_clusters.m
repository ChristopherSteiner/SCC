function plot_clusters(X, a)
% X = a matrix each row represents a point
% a = a vector containing the indices of the cluster
% Plots the cluster in different colours
cluster_count = max(a);
hold off;
hold on;
if cluster_count == 2    
    P1 = X(a == 1,:);
    P2 = X(a == 2,:);
    plot(P1(:,1), P1(:,2), 'bo');
    plot(P2(:,1), P2(:,2), 'go');
elseif cluster_count == 3
    P1 = X(a == 1,:);
    P2 = X(a == 2,:);
    P3 = X(a == 3,:);
    plot(P1(:,1), P1(:,2), 'bo');
    plot(P2(:,1), P2(:,2), 'go');
    plot(P3(:,1), P3(:,2), 'ro');    
elseif cluster_count == 4
    P1 = X(a == 1,:);
    P2 = X(a == 2,:);
    P3 = X(a == 3,:);
    P4 = X(a == 4,:);
    plot(P1(:,1), P1(:,2), 'bo');
    plot(P2(:,1), P2(:,2), 'go');
    plot(P3(:,1), P3(:,2), 'ro');
    plot(P4(:,1), P4(:,2), 'mo');
elseif cluster_count == 5
    P1 = X(a == 1,:);
    P2 = X(a == 2,:);
    P3 = X(a == 3,:);
    P4 = X(a == 4,:);
    P5 = X(a == 5,:);
    plot(P1(:,1), P1(:,2), 'bo');
    plot(P2(:,1), P2(:,2), 'go');
    plot(P3(:,1), P3(:,2), 'ro');
    plot(P4(:,1), P4(:,2), 'mo');
    plot(P5(:,1), P5(:,2), 'yo');
end

end

