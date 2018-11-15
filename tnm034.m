function strout = tnm034(Im)
    strout = '1';
    bw= 1-imbinarize(Im(:,:,1), 0.7);   % 1- pga. objekt r�knas som vitt p� svart.

    angle = findRotationAngle(bw)
    if (angle > 0 || angle < 0)
        Im = imrotate(Im, angle, 'bicubic', 'crop');
        disp("rotated by angle: " + angle)
    end
    
    bw= 1-imbinarize(Im(:,:,1), 0.7);
    cropHeight = tan(deg2rad(angle))*size(Im,2);
    cropWidth = tan(deg2rad(angle))*size(Im,1);
    rect = [cropWidth, cropHeight, size(bw,2)-2*cropWidth, size(bw,1)-2*cropHeight];
    bw = imcrop(bw, rect);
    
    
    
    figure(1)
    plot(sum(bw, 2), 1:size(bw,1));
    figure(2)
    imshow(bw)
end