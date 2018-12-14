% Extract the note beams through morphogical image operations such as
% dilation and erosin. (Matlab imopen)
function beamsImg = extractBeams(img) 
    line = strel('line', 14, 0);
    beamsImg = imopen(img,line);    
end