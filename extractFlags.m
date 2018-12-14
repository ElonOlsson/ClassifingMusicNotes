function flagImg = extractFlags(img)
%     line = strel('line', 12, -45);
    
    flag1 = [false,false,false,false,false,false,false,false,false,false;true,false,false,false,false,false,false,false,false,false;true,false,false,false,false,false,false,false,false,false;true,true,false,false,false,false,false,false,false,false;true,true,false,false,false,false,false,false,false,false;true,true,true,false,false,false,false,false,false,false;true,true,true,true,false,false,false,false,false,false;true,true,true,true,false,false,false,false,false,false;false,true,true,true,true,false,false,false,false,false;false,false,true,true,true,true,false,false,false,false;false,false,false,false,true,true,false,false,false,false;false,false,false,false,false,true,true,false,false,false;false,false,false,false,false,false,true,false,false,false;false,false,false,false,false,false,false,true,false,false;false,false,false,false,false,false,false,true,true,false;false,false,false,false,false,false,false,false,true,false;false,false,false,false,false,false,false,false,true,false;false,false,false,false,false,false,false,false,false,true;false,false,false,false,false,false,false,false,false,true];
    
   img = imdilate(img, [1 1; 1 1; 1 1]);


    flag2 = flipud(flag1);
    
    flagImg = imopen(img,flag1) + imopen(img,flag2); 
    
end

