close all; clear all; clc; % Closes all the garbage

Play = PlayerBuild; % Create player
story = 'Introduction'; % Always start With introduction

while story ~= 0 
    GamePlay(Play, story); % Play story
    
    story = StorySelection(InDir()); % Take story from selection function
end