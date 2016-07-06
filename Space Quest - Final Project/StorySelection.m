function [ option ] = StorySelection(files)

% This function takes the list of files, generated from InDir (see Main.m)
% In this instantation of it, we're just taking that list, and creating a
% pseudo-GUI which allows the player to see what quests and stories are
% available to play. 


list_of_files = files;
num_of_files = length(list_of_files);

fprintf('List of Aventures:\n')
fprintf('0) Quit Game\n')
for i=1:num_of_files
    str = list_of_files{i};
    str = strrep(str, '_', ' '); % replace '_' with spaces
    if strcmp(str,'Introduction') % if introduction 
        list_of_files{i} = []; % removes introduction cell
        i = i - 1; % de-iterates to adjust for removed item
        num_of_files = num_of_files - 1; % necessary for later
    else
        fprintf('%i) %s\n', i, str);
    end
end


selection = input('\nWhich Adventure Would You Like to Play?\n');

% This portion of the code makes sure that the input is valid from 0 to the
% number of files. 0 is reserved for quitting.
while selection > num_of_files || selection < 0
    fprintf('Sorry! That''s not a valid selection, please enter a number between 0 and %i\n', num_of_files)
    selection = input('Which Adventure Would You Like to Play?\n');
end
clc;

if selection == 0
    option = 0; % Returns quit variable
else
    option = list_of_files{selection}; % Returns selection index from list
end

end
