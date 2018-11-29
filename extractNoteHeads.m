function noteHeadImg = extractNoteHeads(img, d)
    
    SE = strel('disk', 4);
    noteHeadImg = imopen(img,SE);    

%     figure;
%     imshow(noteHeadImg);
end