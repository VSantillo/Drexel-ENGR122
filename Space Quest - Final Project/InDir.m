function [ files ] = InDir()

% This function finds the .txt files in the directory, puts it into a cell
% array, then slices the string to remove the .txt file and puts it into a
% new cell so that the player can pick which one they want to play.

clc;

base = dir; % load the directory structure
i = 1; 

while i <= length(base)
    file = strsplit(base(i).name,'.'); % split every file by the period
    if strcmp(file(2),'txt') == 0 % Remove cell if it isn't a txt file
        base(i) = [];    
    else
        files(i) = file(1); % put it in the returned cell array
        i = i + 1; 
    end
end

end