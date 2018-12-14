% Extract the note flags through morphogical image operations such as
% dilation and erosin. (Matlab imopen)
function flagImg = extractFlags(img)
%     img = imdilate(img, [1 1; 1 1; 1 1]);
    
    % Boolean values instead of numerical as an result
    % of copying the beam matrix
    flag1 = [false,false,false,false,false,false;true,false,false,false,false,false;true,false,false,false,false,false;true,true,false,false,false,false;true,true,true,false,false,false;false,true,true,false,false,false;false,false,false,true,false,false;false,false,false,false,true,false;false,false,false,false,true,false;false,false,false,false,false,true;false,false,false,false,false,false];
    
    flag2 = flipud(flag1);
    
    flagImg = imopen(img,flag1) + imopen(img,flag2); 
    
end

