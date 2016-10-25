function [ s ] = distance(p, q)
% computes the euclidean distance between two (not necessarily 2-dimensional) points
% p and q
% Sample Call:
% p = [1;2;6]
% q = [5;9;12]
% distance(p, q) = 10.05
point_size = size(p, 1)
s = 0;
for i=1:point_size
    s = s + (p(i) - q(i)).^2;
end
s = sqrt(s);
end

