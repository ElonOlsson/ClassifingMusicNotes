function noteHeadImg = extractNoteHeads(img, d)
    
    SE = strel('disk', 5);
    noteHeadImg = imopen(img,SE);    

%     figure;
%     imshow(noteHeadImg);
end