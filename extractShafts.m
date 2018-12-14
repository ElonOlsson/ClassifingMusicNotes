function shaftImg = extractShafts(img)
    
    line = strel('line', 15, 90);
    shaftImg = imopen(img,line);    
    
%     figure;
%     imshow(shaftImg);
end