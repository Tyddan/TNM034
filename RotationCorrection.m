function imagereturned = RotationCorrection(image, precision)
    % Detect edges.
    
    BW = edge(image,'prewitt');
    % Perform the Hough transform.
    [H, T, ~] = hough(BW,'Theta',-90:precision:90-precision);  
    % Find the most dominant line direction.
    data=var(H);                      % measure variance at each angle 
    fold=floor(90/precision);         % assume right angles & fold data
    data=data(1:fold) + data(end-fold+1:end);
    [~, column] = max(data);          % the column with the crispiest peaks
    angle = T(column);               % column to degrees 
    if angle <= 20 & angle >= -20
        image = imrotate(image, -0.47,'nearest','crop');
        imagereturned = imrotate(image,angle,'nearest','crop');
%         imagereturned = imresize(imagereturned, [size(image(:,1)) size(image(1,:))]);
    else
        imagereturned = image;
    end
end
