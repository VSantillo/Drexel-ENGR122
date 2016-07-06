function A = PlayerBuild()

% Constructor for player class

A = Player; 
A.Name = input('What is your name? \n','s'); % Player input name
A.Health = 100; 
A.Alive = 1; % See player class

end