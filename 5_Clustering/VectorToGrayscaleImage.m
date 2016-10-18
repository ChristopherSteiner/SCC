function [ I ] = VectorToGrayscaleImage( V, r, s )
% V = Input vector
% r = row count
% s = column count
% Converts a image back to a grayscale image
I = reshape(V, r, s);
end

