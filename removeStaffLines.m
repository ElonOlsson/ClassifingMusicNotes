function imgNoLines = removeStaffLines(img)
%   opening
    nhood = [0 1 1 0; 0 1 1 0; 0 1 1 0; 0 1 1 0];
%     nhood = [0 1 0; 0 1 0; 0 1 0]
    imgNoLines = imopen(img, nhood);
    
%   dilation
    nhoodD = [0 1 0; 0 1 0; 0 1 0]
    imgNoLines = imclose(imgNoLines,nhoodD);

    imshow(imgNoLines)
end