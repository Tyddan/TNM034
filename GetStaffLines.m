function [pks, locs, imagerotated] = GetStaffLines(image)

precision = 0.05;
imagerotated = RotationCorrection(image,precision);
imagerotated = imrotate(imagerotated, 0.47,'nearest','crop');

bw = bwmorph(imagerotated,'clean');
bw = bwmorph(bw,'thicken');
bw = bwmorph(bw,'close');

SE = strel('line',5, 0);
bw1 = imopen(bw,SE);

h = sum(bw1,2);

thresh = 340; 
h = h > thresh;

[pks, locs] = findpeaks(double(h));
end