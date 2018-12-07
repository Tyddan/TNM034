function [nPoint] = nearestPoint(x,listOfLines)

[value,closestIndex] = min(abs(listOfLines(:) - x));

nPoint = closestIndex;

end