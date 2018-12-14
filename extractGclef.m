% Template matching and removal of G-clef
function Gclef = extractGclef(img)  
    template = imread('gclef-original.jpg');
    c = normxcorr2(template(:,:,1), img(:,:,1));
    [ypeak, xpeak] = find(c==max(c(:)));
    
    rect = [max(xpeak), 0, size(img,2)-max(xpeak), size(img,1)];
    Gclef = imcrop(img, rect);
 end