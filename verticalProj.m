function locs = verticalProj(img)
    [peaks, locs] = findpeaks(sum(img, 1))
    plot(sum(img,1))
end