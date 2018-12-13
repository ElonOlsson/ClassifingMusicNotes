% Extract the note flags through morphogical image operations such as
% dilation and erosin. (Matlab imopen)
function flagImg = extractFlags(img)
    % Boolean values instead of numerical as an result
    % of copying the beam matrix
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

