function [WhiteSpaceMedian, music_segment_locs] = whitespacelength(locs, image)

WhiteSpaceWidth = [locs',size(image,1)]-[0,locs']
WhiteSpaceMedian = median(sort(WhiteSpaceWidth));
music_segment_whitespace_idx = find(abs(WhiteSpaceWidth)<10);
scan_locs = [0;locs;size(image,1)];
music_segment_whitespace_idx = music_segment_whitespace_idx(1:2:size(music_segment_whitespace_idx,2));
music_segment_locs = scan_locs(music_segment_whitespace_idx)'+floor(WhiteSpaceWidth(music_segment_whitespace_idx)./2);


end