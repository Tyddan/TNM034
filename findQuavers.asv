function [outs] = findQuavers(points,altImage, median)

SE = strel('line', floor(median/2+1), 0);
img = imopen(altImage,SE);
img = bwmorph(img,'open');
img = bwmorph(img,'thicken');

[rows, cols] = size(img);

horizontalProfile = sum(img, 1); 
thresh = 11;
horizontalProfile = horizontalProfile > thresh;
%figure; plot(1:cols,horizontalProfile); 
[pks, locs] = findpeaks(double(horizontalProfile));

    for i = 1:length(locs)
        if ismember(round(points), round(locs(i)-12):round(locs(i)+12))
            outs = 1;
            break;
        else 
            outs = 0;
        end
    end
end

