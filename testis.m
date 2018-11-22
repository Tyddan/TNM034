clear all
clc

a=imread('im5s.jpg'); 
a = rgb2gray(a);
bw = 1-imbinarize(a); 
bw = imrotate(bw, 0.47);
h = sum(bw,2);

thresh = 300;
h = h > thresh;

figure(1);
plot(h,1:size(h));

[pks, locs] = findpeaks(double(h));
figure(2);
imshow(bw)
hold on
for i = 1:size(locs,1)
   plot([1;size(bw,2)], [locs(i,1);locs(i,1)] , 'r');
end

hold on
plot(h,1:size(h));

% Bw2 = bwmorph(bw,'open');
% figure(3);
% imshow(Bw2);


SE = strel('disk',4);
bw2 = imopen(bw,SE);
figure(4);
imshow(bw2,[]);


L = bwlabel(bw2);
s = regionprops(L, 'Centroid');
centroids = cat(1, s.Centroid);
figure(5)
imshow(bw2)
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
hold off

notes = {'F'; 'D'; 'B'; 'G'; 'E'; 'F'; 'D'; 'B'; 'G'; 'E'; 'F'; 'D'; 'B'; 'G'; 'E'};
strout = {};
intCentroids = round(centroids);

for j = 1:size(intCentroids(:,2))
       compCent(j,:) = [intCentroids(j,2)-1 intCentroids(j,2) intCentroids(j,2)+1];  
end


for i = 1:size(locs)
   for k = 1:size(intCentroids(:,2))
       if ismember(locs(i,1),compCent(k,:))
           strout = [strout, {notes(i,1)}];
       end
   end
   
end


