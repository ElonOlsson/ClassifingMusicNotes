function correctAngleIteration = horizontalCorrection(img, it, precision, startPoint)
    inputCopy = imrotate(img, startPoint);
    rotationImg = inputCopy;
    currRot = 0;
    maxPeak = 0; 
    
    for i = 1:it
        pks = findpeaks(sum(rotationImg, 2));
        if maxPeak < max(pks)
            maxPeak = max(pks);
            currRot = i-1;  % pga. indexering börjar på 1
        end
        inputCopy = imrotate(img, startPoint);
        rotationImg = imrotate(inputCopy, -precision*i);
    end
    
    correctAngleIteration = currRot;
end