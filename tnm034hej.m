function strout = tnm034hej(im)
im = imread(im);
figure(1)
imshow(im)
% Im: Input image of captured sheet music. Im should be in
% double format, normalized to the interval [0,1]

% strout: The resulting character string of the detected
% notes. The string must follow a pre-defined format.
imr = imrotate(im, 33);
imgray = rgb2gray(imr);

BW = edge(imgray, 'canny');

[H,theta,rho] = hough(BW);

imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal 
hold on

% imRot = imrotate(im, theta);
% figure(2)
% imshow(imRot)


end

