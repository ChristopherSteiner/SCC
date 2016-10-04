% Warmup Tasks, adding a white and a black rectangle
% and some basic scaling of the image
I = double(imread('koala.jpg'))./255;
%I(1:100, 1:50, 1:3) = 1; % Weisses Rechteck
maxX = size(I, 1);
maxY = size(I, 2);
%I((maxX-60):(maxX), :, 1:3) = 0; %Schwarzer Balken unten
%imagesc(I)

scaleFactor = 1.2;
scaleMatrix = [scaleFactor 0 0; 0 scaleFactor 0; 0 0 1];
Is = 0;

for x=1:maxX
   for y=1:maxY
       scaled = round(scaleMatrix * [x;y;1]);
       Is(scaled(1), scaled(2), 1) = I(x, y, 1);
       Is(scaled(1), scaled(2), 2) = I(x, y, 2);
       Is(scaled(1), scaled(2), 3) = I(x, y, 3);
   end
end

imagesc(Is)