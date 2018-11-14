function rotationAngle = findRotationAngle(biIm)
    
    it = 20;
    lowPrec = 1;
    highPrec = 0.01;
    
    
    horizontalAngleLowPrec = horizontalCorrection(biIm, it, lowPrec, 10);
    horizontalAngleHighPrec = horizontalCorrection(biIm, it*10, highPrec, 10-horizontalAngleLowPrec + 1);
    
    
     %20 �r f�r att vi roterar tot 20 grader. i.e. lika h�g int som antal
     %iterationer.
     % +1 pga analys p� hundradelar inom 1 grad +-
   
    rotationAngle = ((10-horizontalAngleLowPrec) + ((100-horizontalAngleHighPrec)/100));
end



