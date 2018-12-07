function imageret = (median, originalimage)
    SE = strel('line', median+3, 0);
    image = imopen(originalimage,SE);
    image = bwmorph(image,'open');
    image = bwmorph(image,'thicken');
    % 
    figure(2)
    imshow(image)

    [rows, columns] = size(image);
    h = sum(image,1);

    thresh = 8;
    h = h > thresh;

    [nrofsixth, locsixth] = findpeaks(double(h));
    imageret = originalimage;
    for i = 1:length(nrofsixth)
        imageret(:,locsixth(i)-(1.1*whiteSpaceMedian):locsixth(i)+(2.1*whiteSpaceMedian)) = 0;
    end
end

