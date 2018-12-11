function str = tnm034(Im)
    binarizeThreshold = 0.8;
    bw= 1-imbinarize(Im(:,:,1), binarizeThreshold);   % 1- pga. objekt r�knas som vitt p� svart.
    angle = findRotationAngle(bw);
    if (angle > 0 || angle < 0)
        Im = imrotate(Im, angle, 'bicubic', 'crop');
    end
    
    bw= 1-imbinarize(Im(:,:,1), binarizeThreshold);
    % Crop rotation corner articacts 
    cropHeight = tan(deg2rad(abs(angle)))*size(Im,2);
    cropWidth = tan(deg2rad(abs(angle)))*size(Im,1);
    rect = [cropWidth, cropHeight, size(Im,2)-2*cropWidth, size(Im,1)-2*cropHeight];
    bw = imcrop(bw, rect);
    Im = imcrop(Im, rect);
    
    % find maxPeak
    [pks, locs] = findpeaks(sum(bw, 2));
    maxPeak = max(pks);

    % Get location of peaks
    peakThreshold = 0.6; % getPeakThreshold(?);
    locs = locs(pks>peakThreshold*maxPeak);
    locationMatrix = vec2mat(locs', 5); 
    nrOfBars = size(locationMatrix, 1);
    
    subImages = imageSegmentation(Im, locationMatrix, nrOfBars);
    
    str = '';
    for i=1:nrOfBars
        str = strcat(str, analysOfSubImage(subImages(:,:,i)));
    end
    str = char(str);
    str = str(1:end-1); % removes last n ( from line break );

end