clear all
clc

precision = 0.05; % precision of rotation in percent 

image=imread('im1s.jpg'); 
image = rgb2gray(image);

[peaks, stafflocations, imrotated] = GetStaffLines(image,precision);

figure(3);
imshow(imrotated)
hold on
for i = 1:size(stafflocations,1)
   plot([1;size(imrotated,2)], [stafflocations(i,1);stafflocations(i,1)] , 'r');
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


[whiteSpaceMedian, segmentLocs] = whitespacelength(stafflocations,imrotated);

figure(3);
imshow(imrotated);
hold on; 
for i=1:size(segmentLocs,2)
    plot([1;size(imrotated,2)],[segmentLocs(1,i);segmentLocs(1,i)],'m');
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
% lines(1) = locs(1)-round(whiteSpaceMedian/2);
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

SE = strel('disk',floor(whiteSpaceMedian/2));
bw2 = imopen(imrotated,SE);
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
%%
template = imread('Nothuvud.png');
template = rgb2gray(template);

templ = imresize(template, [whiteSpaceMedian, whiteSpaceMedian * (315/144)]);

approxDist = 0;
longestdist = 0;
for i = 1:length(stafflocations)- 1
    approxDist = stafflocations(i+1) - stafflocations(i);
    if longestdist < approxDist
        longestdist = approxDist;
    end
end

[rows, cols] = size(imrotated);
fromrow = 1;
torow = rows;
temp = 1;
for i = 1: (length(stafflocations)/5)
    torow = stafflocations(5*i) + floor(longestdist/2);
    if(i == length(stafflocations)/5)
       torow = rows;
    end
    divArray{i} = imrotated(fromrow:torow, :);
    fromrow = lines(5*i) + floor(longestdist/2);
end

index = 1;

for j = 1:length(divArray)
    [L,NUM] = bwlabel(divArray{j});
    for i = 1:NUM 
        [r,c] = find(L == i);
        r = sort(r);
        c = sort(c);
        rows = r(1):r(end);
        cols = c(1):c(end);
        mask = (L==i);
        L(mask) = index;
        noteArray{index} = L(rows,cols);
        index = index+1; 
    end
    
    if(j==1)
        labelImg = L;
    else
        labelImg = [labelImg; L];
    end

end

noteHeadImg = normxcorr2(templ, labelImg);

figure(6)
imshow(noteHeadImg);


% for i = 1:2*size(stafflocations)
%    for k = 1:size(intCentroids(:,2))
%        if ismember(lines(1,i),compCent(k,:))
%            strout = [strout, {notes(i,1)}];
%        end
%    end 
% end

%%

nrOfNotes = 20;                          
rows = length(stafflocations);           
pitchLines = zeros(rows,nrOfNotes);
firstLine = 1;
approxDist = stafflocations(2)-stafflocations(1);     

for i = 1:rows
    nextPitch = 0;
    for j = 1:nrOfNotes
       pitchLines(i,j) = stafflocations(firstLine) + (approxDist) - nextPitch;
       nextPitch = nextPitch + (approxDist/2);
    end
    firstLine = firstLine + 5;
end

output = pitchLines;
%%

image=imread('im9c.jpg'); 
image = rgb2gray(image);
[peaks, stafflocations, im] = GetStaffLines(image,precision);

image = im(stafflocations(1)-(whiteSpaceMedian*4):stafflocations(5)+(whiteSpaceMedian*4),:);
%imshow(image);
k = 1;
smallPic = {};
filtredPic = {};
L = {};
s = {};
centroids = {};

for i = 1:(length(peaks)/5)
    smallPic{i} = im(stafflocations(k)-(whiteSpaceMedian*4):stafflocations(k+4)+(whiteSpaceMedian*4),:);
    k = k + 5;
end


SE = strel('disk',floor(whiteSpaceMedian/2));

for a = 1:(length(peaks)/5)
    filtredPic{a} = imopen(smallPic{a},SE);
end
%%

for b = 1:(length(peaks)/5)
    L{b} = bwlabel(filtredPic{b});
    s{b} = regionprops(L{b}, 'Centroid');
    centroids{b} = cat(1, s{b}.Centroid);
end

figure;
imshow(filtredPic{1},[]);
hold on
plot(centroids{1,1}(:,1), centroids{1,1}(:,2), 'b*')
hold off
figure;
imshow(filtredPic{2},[]);
hold on
plot(centroids{1,2}(:,1), centroids{1,2}(:,2), 'b*')
hold off
figure;
imshow(filtredPic{3},[]);
hold on
plot(centroids{1,3}(:,1), centroids{1,3}(:,2), 'b*')
hold off


%%

[pitchLines] = createLines(stafflocations,whiteSpaceMedian);

%%
for i = length(centroids)
    for j = length(centroids{i})
        uint32(centroids{1,i}(j,2));
    end
end



%%
for i = length(centroids)
    for j = length(centroids{i})
        
        indexhej = nearestNeighbor(pitchLines{:,1},round(centroids{1,i}(j,2)));
    end
end


