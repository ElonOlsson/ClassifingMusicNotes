function noteHeadImg = extractNoteHeads(img)
    
    SE = strel('disk', 4);
    noteHeadImg = imopen(img,SE);
    
%     figure;
%     imshow(noteHeadImg);
end