function strout = test1(Im)
    strout = '1';
    bw= 1-imbinarize(Im(:,:,1), 0.7);   % 1- pga. objekt räknas som vitt på svart.
   
    angle = findRotationAngle(bw)
    if (angle > 0 || angle < 0)
        bw = imrotate(bw, angle);
        disp("rotated by angle: " + angle)
    end
    figure(1)
    plot(sum(bw, 2), 1:size(bw,1));
    
    figure(2)
    imshow(bw)
end