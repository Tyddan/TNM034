function [pitchLines] = createLines(stafflocations,whiteSpaceMedian)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

pitchLines = {};
k = 3;

pitchLines{7,1}= stafflocations(1);
pitchLines{9}= stafflocations(2);
pitchLines{11}= stafflocations(3);
pitchLines{13}= stafflocations(4);
pitchLines{15}= stafflocations(5);


pitchLines{8}= round((stafflocations(2)+stafflocations(1))/2);
pitchLines{10}= round((stafflocations(3)+stafflocations(2))/2);
pitchLines{12}= round((stafflocations(4)+stafflocations(3))/2);
pitchLines{14}= round((stafflocations(5)+stafflocations(4))/2);



pitchLines{1} = stafflocations(1) - k*ceil(whiteSpaceMedian);
 
for i = 2:6
    pitchLines{i} = pitchLines{i-1} + (ceil(whiteSpaceMedian)/2);
end


for i = 16:20
    
    pitchLines{i} = pitchLines{i-1} + (ceil(whiteSpaceMedian)/2);
    
end

notes = {'E4';'D4'; 'C4';'B3';'A3';'G3'; 'F3';'E3'; 'D3';'C3'; 'B2';'A2'; 'G2';'F2';'E2';'D2'; 'C2';'B1'; 'A1';'G1'}; 
notesSmall = {'e4';'d4'; 'c4';'b3';'a3'; 'g3'; 'f3';'e3'; 'd3';'c3'; 'b2';'a2'; 'g2';'f2';'e2';'d2'; 'c2';'b1'; 'a1';'g1'}; 

for i = 1:20
    pitchLines{i,2} = notes{i};
    pitchLines{i,3} = notesSmall{i};
end


end