ImIn = imread('Images_Training\Images_Training\im6s.jpg');
Im = im2double(ImIn);
tic;

% flag = imread('flagNote.jpg');
% binarizeThreshold = 0.8;
% flag = 1-imbinarize(flag(:,:,1), binarizeThreshold);   % 1- pga. objekt räknas som vitt på svart.
% flag = imcrop(flag, [62 ,0, 50, 160]);
% 
% subImgSize = 32;
% imgHeight = size(flag, 1);
% 
% imgScaleFactor = subImgSize / imgHeight;
% flag = imresize(flag, imgScaleFactor, 'bicubic');
% 
% binarizeThreshold = 0.9;
% flag = imbinarize(flag(:,:,1), binarizeThreshold);

% figure;
% imshow(flag);

strout = tnm034(Im)
toc;