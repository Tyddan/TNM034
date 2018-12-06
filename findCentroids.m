function [centroids] = findCentroids(image,pks)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for b = 1:(length(pks)/5)
    L{b} = bwlabel(image{b});
    s{b} = regionprops(L{b}, 'Centroid');
    centroids{b} = cat(1, s{b}.Centroid);
end

end

