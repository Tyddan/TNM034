function pitchLines = findPitchLines(stafflocs, whiteSpace, pks)

pitchLines = {};
k = 1;
for i = 1:(length(pks)/5)
    [pitchLines{i}] = createLines(stafflocs(k:k+4,:),whiteSpace);
    k = k + 5;
end

end

