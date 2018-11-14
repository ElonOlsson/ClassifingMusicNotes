function angle = findRotationAngle(biIm)
    inputCopy = imrotate(biIm,10);
    rotim = inputCopy;
    currRot = 0;
    maxValue = 0; 
    
    for i = 1:20
        pks = findpeaks(sum(rotim, 2));
        if maxValue < max(pks)
            maxValue = max(pks);
            currRot = i-1;  % pga. indexering b�rjar p� 1
        end
        inputCopy = imrotate(biIm,10);
        rotim = imrotate(inputCopy, -1*i);
    end
     %20 �r f�r att vi roterar tot 20 grader. i.e. lika h�g int som antal
     %iterationer.
     % +1 pga analys p� hundradelar inom 1 grad +-
  
    rotim = imrotate(biIm,10-currRot + 1);
    inputCopy = rotim;
    currRotSmall = 0;
    maxValue = 0;
    for i = 1:200
        pks = findpeaks(sum(rotim, 2));
        if maxValue < max(pks)
            maxValue = max(pks);
            currRotSmall = i-1;  % pga. indexering b�rjar p� 1
        end
        inputCopy = imrotate(biIm,10-currRot + 1);
        rotim = imrotate(inputCopy, -0.01*i);
    end
   
    angle = ((10-currRot) + ((100-currRotSmall)/100));
end



