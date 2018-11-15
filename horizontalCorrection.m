function correctAngleIteration = horizontalCorrection(img, it, precision, startPoint)
    inputCopy = imrotate(img, startPoint, 'bicubic');
    rotationImg = inputCopy;
    currRot = 0;
    maxPeak = 0; 
    
    for i = 1:it
        pks = findpeaks(sum(rotationImg, 2));
        if maxPeak < max(pks)
            maxPeak = max(pks);
            currRot = i-1;  % pga. indexering b�rjar p� 1
        end
        inputCopy = imrotate(img, startPoint, 'bicubic');
        rotationImg = imrotate(inputCopy, -precision*i, 'bicubic');
    end
    
    correctAngleIteration = currRot;
end