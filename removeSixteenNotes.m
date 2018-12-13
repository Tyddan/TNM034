function imageret = removeSixteenNotes(median, originalimage,pks)
    SE = strel('line', median, 0);
    imageret = {};
   for i = 1:(length(pks)/5)
        image = imopen(originalimage{i},SE);
        image = bwmorph(image,'open');
        image = bwmorph(image,'thicken');


        [rows, columns] = size(image);
        h = sum(image,1);

        thresh = 17;
        h = h > thresh;

        [nrofsixth, locsixth] = findpeaks(double(h));
        imageret{i} = originalimage{i};
        for j = 1:length(nrofsixth)
            imageret{i}(:,round(locsixth(j)-(1.1*median)):round(locsixth(j)+(2.1*median))) = 0;
        end
   end
end

