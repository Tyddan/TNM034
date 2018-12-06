function [M] = sortFunction(x, element)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% %%
% varLength = length(element);
% %%
% cellOfNotes = cell(varLength);
tempX = x;
tempElement = element;

A = length(tempX);
B = length(tempElement);

C = cell(length(x), 1);

for i = 1:1:length(x)
    for k = 1:2
    C{i,k} = [{x(i)},{element(i)}];
    end
end

C
M = 1;

end

