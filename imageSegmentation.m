function subImages = imageSegmentation(img, locMat, nrOfBars)

    barHeight = locMat(1,5) - locMat(1,1);
    dPLUSnMean = barHeight / 4; % 4 instead of 5 because its 4 intervals between the 5 values. 
    marginTop = 4*dPLUSnMean;
    subImgHeight = 11*dPLUSnMean;
    for i = 1:nrOfBars
        rect = [0, locMat(i,1)-marginTop, size(img, 2), subImgHeight];
        subImages(:,:,i) = imcrop(img, rect);
    end
end