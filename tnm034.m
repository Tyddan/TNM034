function strout = tnm034(testImage)

% Get stafflines
[peaks, staffLocations, imageRotated] = GetStaffLines(testImage);


%% Whitespace
whiteSpaceMedian = whitespaceLength(staffLocations,imageRotated);
%%
image = removeGcleff(imageRotated);

%%
%Create a mask
dividedImage = createMask(image,whiteSpaceMedian, staffLocations, peaks);

%% 
%Remove sixteenNotes

image = removeSixteenNotes(whiteSpaceMedian,dividedImage,peaks);

%%
%Centroids
centroids = findCentroids(image,peaks,whiteSpaceMedian);

%%
% Pitchlines
pitchLines = findPitchLines(staffLocations, whiteSpaceMedian, peaks);
%%
% Find note
strout = findNote(centroids, pitchLines, image, whiteSpaceMedian);

end

