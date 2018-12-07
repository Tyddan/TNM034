function image = removeGcleff(im)
    thickim = bwmorph(im,'thicken');

    h = sum(thickim,1);

    [rows, columns] = size(im);

    thresh = 150; 
    h = h > thresh;

    [vpks, Gcleffloc] = findpeaks(double(h));

    image = im(:,Gcleffloc(1)+25:columns);
end