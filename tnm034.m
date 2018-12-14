function str = tnm034(Im)

    % Converting the image to binary image with binary threshold of 0.8
    binarizeThreshold = 0.8;
    bw= 1-imbinarize(Im(:,:,1), binarizeThreshold);   % 1- pga. objekt räknas som vitt på svart.

    angle = findRotationAngle(bw);
    % Rotate the original image with the given angle
    if (angle > 0 || angle < 0)
        Im = imrotate(Im, angle, 'bicubic', 'crop');
    end
    

    % Crop rotation corner articacts post image rotation
    cropHeight = tan(deg2rad(abs(angle)))*size(Im,2);
    cropWidth = tan(deg2rad(abs(angle)))*size(Im,1);
    rect = [cropWidth, cropHeight, size(Im,2)-2*cropWidth, size(Im,1)-2*cropHeight];

    Im = imcrop(Im, rect);
    % Extracting the position of the G-clef and cropping the note sheet to
    % erase it
    Im = extractGclef(Im);
    % Convert it to binary image 
    bw= 1-imbinarize(Im(:,:,1), binarizeThreshold);
    
    % Analyze staff lines of smaller part of image
    rect = [0, 0, size(bw, 2)/4, size(bw, 1)];
    quarterBw = imcrop(bw, rect);
    
    % find maxPeak
    [pks, locs] = findpeaks(sum(quarterBw, 2));
    maxPeak = max(pks);

    % Get location of peaks
    peakThreshold = 0.5; % getPeakThreshold(?);
    locs = locs(pks>peakThreshold*maxPeak);
    locationMatrix = vec2mat(locs', 5); 

    % Get the number of bars
    nrOfBars = size(locationMatrix, 1);
    
    % Divide the original image dependent on the number of bars
    subImages = imageSegmentation(Im, locationMatrix, nrOfBars);
        
    str = '';
    % Get the note string for each bar
    for i=1:nrOfBars
        str = strcat(str, analysisOfSubImage(subImages(:,:,i)));
    end
    str = char(str);
    str = str(1:end-1); % removes last n ( from line break );

end