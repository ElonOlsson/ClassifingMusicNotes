function noteHeadImg = extractNoteHeads(img)
    SE = strel('disk', 5);
    noteHeadImg = imopen(img,SE);    
end