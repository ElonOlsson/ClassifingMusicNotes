function flagImg = extractFlags(img)
%     line = strel('line', 12, -45);
    
    flag = [true,false,false,false,false,false;
        true,true,false,false,false,false;
        true,true,false,false,false,false;
        true,true,true,false,false,false;
        false,false,true,true,false,false;
        false,false,false,true,false,false;
        false,false,false,false,true,false;
        false,false,false,false,false,true;
        false,false,false,false,false,true];
    
    flagImg = imopen(img,flag);    
end

