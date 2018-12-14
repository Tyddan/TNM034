function notes = findNote(cent,lines,dividedImage, median)
    
    notes = "";
    for i = 1:length(cent)
        for j = 1:length(cent{i})
            
            % Index the note
           indexOfNote = nearestPoint(cent{1,i}(j,2),cell2mat(lines{1,i}(:,1)));
            
            % Check if sixteen or eight 
           isQuaver = findQuavers(cent{1,i}(j,1),dividedImage{i},median);
           
           if isQuaver == 1
               notes = [notes, cell2mat(lines{1,i}(indexOfNote,3))];
           else 
               notes = [notes, cell2mat(lines{1,i}(indexOfNote,2))];
           end
           
        end
        notes = [notes, 'n'];
    end
    
    notes = strjoin(notes);
end

