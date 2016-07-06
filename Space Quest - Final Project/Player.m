classdef Player
    properties
        Name % Constructed in the PlayerBuild
        Health % Constructed Outside
        Alive % 1 = Alive, 0 = Defeated
    end
    methods 
        function obj = CheckAlive(obj)
            if obj.Health <= 0
                obj.Alive = 0;
            end        
         end
    end
end