% img is binarized image. locMat = matrix of location for peaks. nrOfBars =
% number of bars
function subImages = imageSegmentation(img, locMat, nrOfBars)
    barHeight = locMat(1,5) - locMat(1,1);
    dPLUSnMean = barHeight / 4; % 4 instead of 5 because its 4 intervals between the 5 values. % Maybe use floor or roof to make it an int
    marginTop = 4*dPLUSnMean;
    subImgHeight = 11*dPLUSnMean;
    for i = 1:nrOfBars
        rect = [0, locMat(i,1)-marginTop, size(img, 2), subImgHeight];
        subImages(:,:,i) = imcrop(img(:,:,1), rect);
    end
end