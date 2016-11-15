function [I] = Load_and_scale_image(person_id, expression)

img_scale = 0.6;

% Load face
I=imread(sprintf('s%i\\%i.pgm',person_id,expression));
I=imresize(I,img_scale,'bicubic');
I = double(I);


