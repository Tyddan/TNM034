clear all
clc
precision = 0.1;
image =imread('im9c.jpg');
image = rgb2gray(image);
imrot = RotationCorrection(image, precision);
y = 100;
x  = linspace(0,1000);

imshow(image)

figure

plot(x,y, 'LineWidth', 10);
hold on
imshow(imrot)
hold off