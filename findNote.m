function notes = findNote(cent,lines)
    
    notes = "";
    for i = 1:length(cent)
        for j = 1:length(cent{i})
            indexOfNote = nearestPoint(cent{1,i}(j,2),cell2mat(lines{1,i}(:,1)));
            notes = [notes, cell2mat(lines{1,i}(indexOfNote,2))];
        end
        notes = [notes, 'n'];
    end
end

