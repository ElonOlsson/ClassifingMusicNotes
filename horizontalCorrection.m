% Function to rotate an image first "back" to a startpoint then continue
% with a given angle at each iteration. For each angle we check the
% horizontal projection to find the one with the highest peak = optimal
% rotation angle. 
function correctAngleIteration = horizontalCorrection(img, it, precision, startPoint)
    
    inputCopy = imrotate(img, startPoint, 'bicubic');
    rotationImg = inputCopy;
    currRot = 0;
    maxPeak = 0; 
    for i = 1:it
        pks = findpeaks(sum(rotationImg, 2));
        if maxPeak < max(pks)
            maxPeak = max(pks);
            currRot = i-1;  % pga. indexering börjar på 1
        end
        inputCopy = imrotate(img, startPoint, 'bicubic');
        rotationImg = imrotate(inputCopy, -precision*i, 'bicubic');
    end
    
    correctAngleIteration = currRot;
end