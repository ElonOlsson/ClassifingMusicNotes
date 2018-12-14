% Extract the note heads through morphogical image operations such as
% dilation and erosin. (Matlab imopen)
function noteHeadImg = extractNoteHeads(img)
    SE = strel('disk', 5);
    noteHeadImg = imopen(img,SE);    
end