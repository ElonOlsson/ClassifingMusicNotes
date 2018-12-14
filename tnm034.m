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

%     figure;
%     plot(sum(quarterBw,2));

    maxPeak = max(pks);
    peakThreshold = 0.8;

    % Get location of peaks
    locs = locs(pks>peakThreshold*maxPeak);
    distanceArray = zeros(size(locs));
    for i = 1:length(locs)-1
        distanceArray(i) = abs(locs(i)-locs(i+1));
    end
    distanceBetweenBars = ceil(median(distanceArray)) + 2;
    

    % Erase the location of a peak if the distance to the peak above and
    % under is more than 10. (To make sure that only the position of staff
    % lines is used for the image segmentation).

    %filteredLocs;
    it = 1;
    for i = 2:length(locs)-1
        if(abs(locs(i)-locs(i-1)) > distanceBetweenBars && abs(locs(i)-locs(i+1)) > distanceBetweenBars)
            % Do nothing
        else
            filteredLocs(it) = locs(i);
            it = it+1;
        end
    end
    
    if(abs(locs(end)-locs(end-1)) <= distanceBetweenBars)
       filteredLocs = [filteredLocs, locs(end)];
    end
    
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