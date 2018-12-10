function beamsImg = extractBeams(img)
    
    line = strel('line', 14, 0);
%     line = [0 0 0 0 0; 1 1 1 1 1; 1 1 1 1 1; 0 0 0 0 0];

    beamsImg = imopen(img,line);    
    
%     figure;
%     imshow(noteHeadImg);
end