function GamePlay(player,story)
    x = 0; 
    name = player.Name; %passes name
    
    StoryTeller(name, story); % Reads from txt file 'story'

% The following loop will take the name of the story, find the indice
% of the second underscore and chop it off and move back one so we could
% get to the appropriate .m file.

    if length(story) > 17 
        for i=1:length(story) 
            if strcmp(story(i),'_') == 1 
                x = x + 1;
            end
            if x == 2
                story = story(1:i-1);
                x = x + 1;
                break;
            end
        end

    story = strcat(story,'(player)'); % Attaches player argument to string
    eval(story) % Evalutes the .m file
    
    
    end