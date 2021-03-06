% Finding the optimal rotation angle to rotate the input image to make it
% horizontally correct. 
function rotationAngle = findRotationAngle(biIm)
    
    it = 20;
    lowPrec = 1;
    highPrec = 0.01;
    
    % First rotate it 20 degrees to check the angle with low precision
    horizontalAngleLowPrec = horizontalCorrection(biIm, it, lowPrec, 10);
    % Then rotate it 2 degrees to check the angle with high precision
    horizontalAngleHighPrec = horizontalCorrection(biIm, it*10, highPrec, 10-horizontalAngleLowPrec + 1);
   
    rotationAngle = ((10-horizontalAngleLowPrec) + ((100-horizontalAngleHighPrec)/100));
end



