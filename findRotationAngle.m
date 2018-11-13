function angle = findRotationAngle(biIm)
    
    rotim = imrotate(biIm, 10);
    currRot = 0;
    maxValue = 0;
    for i = 1:20
        pks = findpeaks(sum(rotim, 2));
        if maxValue < max(pks)
            maxValue = max(pks);
            currRot = i-1;  % pga. indexering börjar på 1
        end
        
        rotim = imrotate(rotim, -1);
    end
     %20 är för att vi roterar tot 20 grader. i.e. lika hög int som antal iterationer.
     % +1 pga analys på hundradelar inom 1 grad +-
    rotim = imrotate(rotim,20-currRot + 1);
    
    currRotSmall = 0;
    maxValue = 0;
    for i = 1:200
        pks = findpeaks(sum(rotim, 2));
        if maxValue < max(pks)
            maxValue = max(pks);
            currRotSmall = i-1;  % pga. indexering börjar på 1
        end
        
        rotim = imrotate(rotim, -0.01);
    end
    
    angle = -((10-currRot) + ((100-currRotSmall)/100));
end



