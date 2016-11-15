function [ V ] = Get_eigenvectors(data_mat, k)
% Returns the k first eigenvectors from the
% given matrix where each row represents a data point
C = cov(data_mat);
[V_unsorted, D] = eig(C);
[sorted, index] = sort(D);

for cont=1:length(sorted)
    V(:,cont)=V_unsorted(:,index(cont));
end 
 V = V(:, 1:k);
end

