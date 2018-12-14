% Removing staff lines but not using the imopen function because of
% different kernels. No specific reason why but worked fine so we are
% keeping it that way.
function imgNoLines = removeStaffLines(img)
    % Erosion
    nhood = [0 1 1 0; 0 1 1 0; 0 1 1 0; 0 1 1 0];
    imgNoLines = imerode(img, nhood);
    
    % Dilation
    nhoodD = [0 1 0; 0 1 0; 0 1 0];
    imgNoLines = imdilate(imgNoLines,nhoodD);    
end