function imgNoLines = removeStaffLines(img)
%   opening
    nhood = [0 1 1 0; 0 1 1 0; 0 1 1 0; 0 1 1 0];
%     nhood = [0 1 0; 0 1 0; 0 1 0]
    imgNoLines = imerode(img, nhood);
    
%   dilation
    nhoodD = [0 1 0; 0 1 0; 0 1 0];
    imgNoLines = imdilate(imgNoLines,nhoodD);

%     pointImg = bwmorph(imgNoLines, 'shrink',  Inf);

    figure;
    imshow(imgNoLines)
end