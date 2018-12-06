clear all
clc

precision = 0.05; % precision of rotation in percent 

image=imread('im1s.jpg'); 
image = rgb2gray(image);

[peaks, stafflocations, imrotated] = GetStaffLines(image,precision);
image = removeGcleff(imrotated);

figure(3);
imshow(image)
hold on
for i = 1:size(stafflocations,1)
   plot([1;size(image,2)], [stafflocations(i,1);stafflocations(i,1)] , 'r');
end

%%
% Bw2 = bwmorph(bw,'open');
% figure(3);
% imshow(Bw2);

% h = fspecial('sobel');
% h = h';
% img = imfilter(bw,h);

% 
% img = bwmorph(img,'fill');
% img = bwmorph(img,'erode');
% img = bwmorph(img,'majority');


[whiteSpaceMedian, segmentLocs] = whitespacelength(stafflocations,image);

figure(3);
imshow(image);
hold on; 
for i=1:size(segmentLocs,2)
    plot([1;size(bw,2)],[segmentLocs(1,i);segmentLocs(1,i)],'m');
end
hold off;


for j = 1:size(stafflocations)
    locsIncreased(j,:) = [stafflocations(j,1)-1 stafflocations(j,1) stafflocations(j,1)+1];  
end


% bw(locsIncreased,:) = 0;
% 
% bw = bwmorph(bw,'bridge');
% figure(3);
% imshow(bw);


%%
% he = 1;
% lines(1) = stafflocations(1)-round(whiteSpaceMedian/2);
% for l = 2:2:20
%     if he <= 16
%         lines(l) = locs(he);
%         lines(l+1) = locs(he)+round(whiteSpaceMedian/2);
%         he = he + 1;
%     end
%     if he > 16
%         lines(l+1) = lines(l)+round(whiteSpaceMedian/2);
%     end
% end


%%

SE = strel('disk',4);
bw2 = imopen(image,SE);
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

notes = {'F';'E'; 'D';'C';'B';'A'; 'G';'F'; 'E';'D'; 'F';'E'; 'D';'C';'B';'A'; 'G';'F'; 'E';'D'; 'F';'E'; 'D';'C';'B';'A'; 'G';'F'; 'E';'D'};
strout = {};
intCentroids = round(centroids);

for j = 1:size(intCentroids(:,2))
       compCent(j,:) = [intCentroids(j,2)-1 intCentroids(j,2) intCentroids(j,2)+1];  
end



for i = 1:2*size(stafflocations)
   for k = 1:size(intCentroids(:,2))
       if ismember(lines(1,i),compCent(k,:))
           strout = [strout, {notes(i,1)}];
       end
   end 
end


