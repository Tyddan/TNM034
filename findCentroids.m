function [centroids] = findCentroids(image,pks,median)
%finCenteroids returns the location of the note heads center

L = {};
s = {};
centroids = {};

SE = strel('disk',floor(median/2-1));
%Add the pictures to the end result, maskPicture
for a = 1:(length(pks)/5)
    image{a} = imopen(image{a},SE);
end

for b = 1:(length(pks)/5)
    L{b} = bwlabel(image{b});
    s{b} = regionprops(L{b}, 'Centroid');
    centroids{b} = cat(1, s{b}.Centroid);
end


end

