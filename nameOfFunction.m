function [outs] = nameOfFunction(points,altImage, median)




%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% SE = strel('line', median, 90);
% image = imopen(originalimage,SE);
% image = bwmorph(image,'open');
% image = bwmorph(image,'thicken');
%     
% 
% [rows, columns] = size(image{1});
% h = sum(image{1},1);
% 
% thresh = 8;
% h = h > thresh;
%%
SE = strel('line', median, 0);
img = imopen(altImage,SE);
img = bwmorph(img,'open');
img = bwmorph(img,'thicken');

[rows, cols] = size(img);

horizontalProfile = sum(img, 1); 
thresh = 10;
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

