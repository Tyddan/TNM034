function [nPoint] = nearestPoint(x,listOfLines)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

[value,closestIndex] = min(abs(listOfLines(:) - x));

nPoint = closestIndex;

end

