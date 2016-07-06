function BASIC_ADDITION(player)
    AliensDefeated = 0;
    
    while AliensDefeated < 5
            enemy = AlienBuild; % Build enemy
            fprintf('The alien has detected your presence and wishes to make battle!\n')

            while enemy.Health > 0
                x = randi([1 25]); 
                y = randi([1 25]);
                z = x + y; % Answer

                fprintf('The alien calls out to you:\n\n')

                fprintf('What is %i + %i equal to?\n\n',x,y)
                fprintf('Alien Health: %i\n', enemy.Health)
                fprintf('Your Health: %i\n', player.Health)
                answer = input('What is your response?!\n');
                while isinteger(answer) ~= 0
                    fprintf('The answer you provided is not a valid response.\n')
                    fprintf('Please enter an integer.\n')
                    answer = input('What is your response?!\n');
                end
                while answer ~= z % Damage Done To You
                    dmg = abs(answer - z); 
                    player.Health = player.Health - dmg;
                    fprintf('\nYou are incorrect and the alien attacks you!\n')
                    fprintf('You lose %i health points!\n', dmg)
                    player = player.CheckAlive(); % Check if alive
                    if player.Alive == 0 % If defeated, break game
                        fprintf('You have been defeated!\n')
                        fprintf('But not for long! Please review your notes\n')
                        fprintf('And come back and try to save the ship again!\n\n')
                        player.Health = 100; % Reset health
                        pause()
                        return;
                    end
                    % if not dead, you get to try again!
                    fprintf('What is %i + %i equal to?\n\n',x,y)
                    fprintf('Alien Health: %i\n', enemy.Health)
                    fprintf('Your Health: %i\n', player.Health)
                    answer = input('What is your response?!\n');
                end
                if answer == z % Damage to Alien
                    dmg = randi([25 50]); % Randomly generated
                    enemy.Health = enemy.Health - dmg;
                    fprintf('\nYou are correct and successfully attack the alien.\n')
                    fprintf('It loses %i health points!\n\n', dmg)
                    enemy = enemy.CheckAlive(); % check if alive
                end
                if enemy.Alive == 0 % if defeated
                    AliensDefeated = AliensDefeated + 1; 
                    fprintf('You have defeated the alien!\n')
                    fprintf('However there are still %i more to be defeated!\n\n', 5-AliensDefeated)
                end
            end
    end
    fprintf('You have successfully defeated all of the aliens!\n')
    fprintf('Great job!\n')
    pause()
end