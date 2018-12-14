%% TNM034 OMR Project
% Authors: Molly Middagsfjell och Amanda Tyden

%% Clear all, clc
clear all;
close all;
clc;

%% Load image
functionImage = imread('im10s.jpg');
functionImage = rgb2gray(functionImage);


%% Call function
output = tnm034(functionImage)

%% Show image
figure();
imshow(functionImage);

