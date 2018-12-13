%% TNM034 OMR Project
% Authors: Molly Middagsfjell och Amanda Tydén

%% Clear all, clc
clear all;
close all;
clc;

%% Load image
functionImage = imread('im6s.jpg');
functionImage = rgb2gray(functionImage);


%% Call function
output = tnm034(functionImage)

%% Show image
figure();
imshow(functionImage);

% ’g3e3f3e3g2e3f3a2b2C3c3g3e3f3e3g2e3
% nf3a2b2C3c3e2g2g2f2a2A2d3d3g2e3c3
% nf3d3g3a2b2C3c3C3c3’

% ’d3b2d3g3d3b2d3b2g2f2a2d2f2a2c3e3c3a2f2d2f2g2d2g2b2d3b2g3d3b2d3b2g2
% nf2a2d2f2a2c3e3c3a2f2d2f2G2a2d3f3c3e3a2c3e3c3d3f3a2d3f3d3
% ne3g3e3c3a2c3d3f3a3g3b3a3c3e3a2c3e3c3d3f3a2d3f3d3e3g3b3g3e3c3D3’
