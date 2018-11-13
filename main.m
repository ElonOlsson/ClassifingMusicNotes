ImIn = imread('Images_Training\Images_Training\im1s.jpg');
Im = im2double(ImIn);
%strout = tnm034(Im);
tic;
strout = test1(Im);
toc;