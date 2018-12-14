% Extract the note shafts through morphogical image operations such as
% dilation and erosin. (Matlab imopen)
function noteShaftImg = extractShafts(img)    
    line = strel('line', 21, 90);
    noteShaftImg = imopen(img,line);    
end