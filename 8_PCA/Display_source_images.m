function Display_source_images()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global N_PERSON;
global N_EXPRESSION;


clear Img;
for person_id=1:N_PERSON
    for expression=1:N_EXPRESSION
        A = Load_and_scale_image(person_id, expression);
        SizeX=size(A,1);
        SizeY=size(A,2);
        Img((SizeX*(expression-1))+1:(SizeX*expression),(SizeY*(person_id-1))+1:(SizeY*person_id))=A;
    end
end

figure();imagesc(Img);colormap('gray');
axis equal;
pause;


end

