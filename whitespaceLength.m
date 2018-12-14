function WhiteSpaceMedian = whitespaceLength(locs, image)

    WhiteSpaceWidth = [locs',size(image,1)]-[0,locs'];
    WhiteSpaceMedian = median(sort(WhiteSpaceWidth));
end