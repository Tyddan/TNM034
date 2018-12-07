function maskPicture = createMask(image ,median,stafflocs, pks)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Constants
k = 1;

SE = strel('disk',floor(median/2));

%Reshape and gett stafflines from the image
%image = rgb2gray(image);
[rows, cols] = size(image);
%Vi hade tagit bort den men tänker att vi behöver den
%[pks, stafflocs, imageRotated] = GetStaffLines(image);
mimage = {};
%Define the mask and apply it to the image
for i = 1:(length(pks)/5)
    maskedImage = image;
    mask = false(rows,cols);
    mask(stafflocs(k)-(median*4):stafflocs(k+4)+(median*4),:) = true;
    maskedImage(~mask) = 0;
    mimage{i} = maskedImage;
    k = k + 5;
end

%Add the pictures to the end result, maskPicture
for a = 1:(length(pks)/5)
    maskPicture{a} = imopen(mimage{a},SE);
end


end

