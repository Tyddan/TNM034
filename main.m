%% TNM034 OMR Project
% Authors: Molly Middagsfjell

%% Clear all, clc
clear all;
close all;
clc;

%% Load image
functionImage = imread('im9c.jpg');
functionImage = rgb2gray(functionImage);


%% Call function
output = tnm034(functionImage)

%% Show image
figure();
imshow(functionImage);