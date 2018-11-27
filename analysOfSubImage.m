% img is a subimage of fixed size containing one bar of 5 stafflines
function str = analysOfSubImage(img)
    str = 'hej';
    imgHeight = size(img, 1);
    dPLUSn = imgHeight/11;
    marginTop = 4*dPLUSn;
    marginBot = 3*dPLUSn;
    
    % size is 20
    quaterNotes = ['G1' 'A1' 'B1' 'C2' 'D2' 'E2' 'F2' 'G2' 'A2' 'B2' 'C3' 'D3' 'E3' 'F3' 'G3' 'A3' 'B3' 'C4' 'D4' 'E4'];
    eighthNotes = ['g1' 'a1' 'b1' 'c2' 'd2' 'e2' 'f2' 'g2' 'a2' 'b2' 'c3' 'd3' 'e3' 'f3' 'g3' 'a3' 'b3' 'c4' 'd4' 'e4'];
    noLinesImg = removeStaffLines(img);
    
    verticalPeaks = verticalProj(noLinesImg);
    
    str = strcat(str, 'n');
end