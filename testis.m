clear all
clc

a=imread('im1s.jpg'); 
a = rgb2gray(a);
bw = 1-imbinarize(a); 
bw = imrotate(bw, 0.47);
h = sum(bw,2);

threshHold = 300;
h = bw > threshHold;

[pks, locs] = findpeaks(double(h));
imshow(bw)

hold on
for i = 1:size(locs,1)
   plot([1;size(bw,2)], [locs(i,1);locs(i,1)] , 'r');
end

hold on
plot(h,1:size(h));

