

functionImage = imread('im1s.jpg');
testImage = rgb2gray(functionImage);

[peaks, staffLocations, imageRotated] = GetStaffLines(testImage);

whiteSpaceMedian = whitespaceLength(staffLocations,imageRotated);

image = removeGcleff(imageRotated);

dividedImage = createMask(image,whiteSpaceMedian, staffLocations, peaks);

    SE = strel('line', whiteSpaceMedian, 0);
    imageret = {};
   for i = 2%:(length(peaks)/5)
       figure(4)
       imshow(dividedImage{i});
        image = imopen(dividedImage{i},SE);
        image = bwmorph(image,'open');
        image = bwmorph(image,'thicken');
        
        figure(1)
        imshow(image)

        [rows, columns] = size(image);
        h = sum(image,1);

        thresh = 17;
        h = h > thresh;
        
        figure(3)
        plot(1:columns,h);

        [nrofsixth, locsixth] = findpeaks(double(h));
        imageret{i} = dividedImage{i};
        for j = 1:length(nrofsixth)
            imageret{i}(:,round(locsixth(j)-(1*whiteSpaceMedian)):round(locsixth(j)+1.5*whiteSpaceMedian)) = 0;
        end
   end
   figure()
   imshow(imageret{2})