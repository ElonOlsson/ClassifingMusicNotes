function strout = test1(Im)
    strout = '1';
    
    bw= 1-imbinarize(Im(:,:,1), 0.85);   % 1- pga. objekt räknas som vitt på svart.
    plot(sum(bw, 2), 1:size(bw,1));
    figure
    imshow(bw)

end