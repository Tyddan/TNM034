function [pks, locs, imagerotated] = GetStaffLines(image, precision)

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

figure(2);
plot(h,1:size(h));

[pks, locs] = findpeaks(double(h));
end