function StoryTeller(Name,file_string)

% This function takes the story passed into it as a string, appends the
% .txt to the name, and then opens, and reads the file off until it's empty
% or ESCAPE SEQUENCE is written in the file. It compares strings with
% various phrases that achieve specific functions.

clc;

file_string = strcat(file_string,'.txt');
File = fopen(file_string,'r');
x = fgetl(File);
n = 0; % Dramatic Variable

while x ~= -1
    if strcmp(x,'ESCAPE SEQUENCE') % Clears screen and breaks the function
        x = fgetl(File);
        clc;
        break; 
    end
    if strcmp(x,'CLEAR SCREEN') % Clears screen, continues reading
        x = fgetl(File);
        clc;
    end
    if strncmp(x,'PAUSE',5) % Pauses the function
        if x(7) == ' ' % If blank, wait for user input
            pause()
        else
            pause(str2double(x(7))) % If number, wait that long
        end
        x = ' '; % Unprintable line
    end
    if strncmp(x,'DRAMATIC',8) % Dramatic pauses
        if x(10) == '' % If blank, just do it for 3 iterations
            n = 3;
        else % number of iterations
            n = str2double(x(10));
        end
        x = ' '; % Unprintable line
    end
    
    % Replace Name in String
    x = strrep(x,'NAME',Name);
    
    % Print Out % 
    if strcmp(x, ' ') ~= 1  % If string isn't empty
        fprintf(x)
        fprintf('\n')
        x = fgetl(File);
    else  % If string is empty
        x = fgetl(File);  
    end
    
    % Dramatic Pause
    if n ~= 0
        pause(1)
        n = n - 1;
    else
        pause(0)
    end
end
 