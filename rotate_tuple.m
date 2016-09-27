function [ p1, p2, p3, p4 ] = rotate_tuple(p1old,p2old,p3old,p4old, a, b, phi)
%p1-4old = points to rotate
%a = x coordinate of rotation middle
%b = y coordinate of rotation middle
%phi = radian angle
p1 = rotate_around_point(p1old, a, b, phi);
p2 = rotate_around_point(p2old, a, b, phi);
p3 = rotate_around_point(p3old, a, b, phi);
p4 = rotate_around_point(p4old, a, b, phi);

end

