global N_PERSON;
global N_EXPRESSION;
N_PERSON =20;
N_EXPRESSION=5;
N_eigenfaces_displayed = 10;
N_eigenvalues_considered = 300; %upper bound for the number of eigenvectors considered in the compressions
Display_source_images;
clear Src;
%Src is a matrix each row of which corresponds to an image
for person_id=1:N_PERSON
    for expression=1:N_EXPRESSION
        A = Load_and_scale_image(person_id, expression); %scales input images (to speed up the process)  
        cur_row = ((person_id-1)*N_EXPRESSION)+expression;
        A_row = Transform_image_to_row_vector(A);
        Src(:, cur_row) = A_row;
    end
end
%Get eigenfaces and mean face
[V] = Get_eigenvectors(Src, N_eigenfaces_displayed);
m = Get_mean(Src);
%----------------------------------------------------

%Optional: Display eigenfaces and meanface
%-----------------------------------------------------
%Application I: Face Compression

%an image inside the training set, with different levels of compression:
%use 300, 100 and 50, respectively eigenvalues 
I_orig = Load_and_scale_image(2,4);   %some image of the training set ((2,4) can be replaced by any tuple (i,j) with i <= 20, j <= 5)

%1. Compress I_orig with the corresonding number of eigenvalues and display
%the result. Evaluate the result visually (i.e. by looking at it)

%2. Optional: Plot for each compression the contribution of the involved
%eigenvectors (i.e. the componentes of the vector representing the image).

[I_org_compressed, vec_transformed] = ...
    Compress_PCA_image(I_orig, N_eigenvalues_considered, V, m);
figure();   
imagesc(I_org_compressed);  
colormap('gray');

%an image that lies outside the training set
J_orig = Load_and_scale_image(21,6); %some image of the test set (can also be replaced by another one)

%1. Compress J_orig using 300 eigenvalues and display the result.
%2. Optional: Plot for each compression the contribution of the involved
%eigenvectors

[J_org_compressed, vec_transformed] = ...
    Compress_PCA_image(J_orig, N_eigenvalues_considered, V, m);

figure();   
imagesc(J_org_compressed);  
colormap('gray');
%-----------------------------------------------------
%Application II: Face Detector

I=double(imread('FaceDetection.bmp'));
%call FaceDetector with the appropriate parameters (use 300 eigenvalues)
