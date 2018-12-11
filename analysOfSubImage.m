% img is a subimage of fixed size containing one bar of 5 stafflines
function str = analysOfSubImage(img)
    str = '';    
    subImgSize = 120;
    imgHeight = size(img, 1);

    imgScaleFactor = subImgSize / imgHeight;
    img = imresize(img, imgScaleFactor, 'bicubic');
    imgScaledHeight = size(img, 1);
    dPLUSn = imgScaledHeight/11;
    %marginTop = 4*dPLUSn;
    %marginBot = 3*dPLUSn;

    binarizeThreshold = 0.8;
    bw = 1-imbinarize(img(:,:,1), binarizeThreshold);
    
    noteLocations = zeros(1, 20);
    it=1;
    for i=dPLUSn : dPLUSn/2 : imgScaledHeight-dPLUSn/2
        noteLocations(it) = i;     % first 2 elements can not be maped to notes. first note start at element 3.
        it = it+1;
    end

    % size is 20
    quarterNotes = ["E4", "D4", "C4", "B3", "A3", "G3", "F3", "E3", "D3", "C3", "B2", "A2", "G2", "F2", "E2", "D2", "C2", "B1", "A1", "G1"];
    eightNotes = ["e4", "d4", "c4", "b3", "a3", "g3", "f3", "e3", "d3", "c3", "b2", "a2", "g2", "f2", "e2", "d2", "c2", "b1", "a1", "g1"];

    
    bw = extractGclef(bw);
    noLinesImg = removeStaffLines(bw);
    onlyHeadsImg = extractNoteHeads(bw);
    onlyShaftsImg = extractShafts(bw);
    onlyBeamsImg = extractBeams(noLinesImg);
    onlyFlagsImg = extractFlags(noLinesImg);

%     headsAndShafts = onlyShaftsImg + onlyHeadsImg;
    headsAndBeams = onlyHeadsImg + onlyBeamsImg;
    headsBeamsAndFlags = headsAndBeams + onlyFlagsImg;
    

    %figure;
    %imshow(headsAndBeams);
 
    labelHeads = bwlabel(onlyHeadsImg);
    regionHeads = regionprops(labelHeads, 'Centroid');
    centroids = cat(1, regionHeads.Centroid);
    
    
    
    for i=1:size(centroids(:,2)) 
        rect = [ centroids(i,1)-dPLUSn, 0, 2*dPLUSn, 11*dPLUSn];
        noteImg = imcrop(headsBeamsAndFlags, rect);  % size of noteImg differ if croped at edges of img.    %beams, heads and flags only        
        
        pks = findpeaks(sum(noteImg, 2));
        
%         figure;
%         plot(sum(noteImg, 2));
%         imshow(noteImg);

        [m,index] = min(abs(noteLocations-centroids(i, 2)));

        if (length(pks) == 1)
            str = strcat(str, quarterNotes(index));        
        elseif (length(pks) == 2)
            str = strcat(str, eightNotes(index));
        end        
    end
    
    str = strcat(str, "n");
end