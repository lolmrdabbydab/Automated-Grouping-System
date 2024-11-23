function [addToRow, addToGroup] = joinRandomGroup(groupTable, groupCanJoin)

    % Change random number generator seed by current time to ensure randomness
    rng("shuffle"); 

    % Choose a random group by randomizing groupCanJoin index
    randIndex = randi(length(groupCanJoin));
    addToGroup = groupCanJoin(randIndex);
    
    % Find all empty positions in a group
    zeroPos = find(groupTable(:, addToGroup) == "0");
    
    % Identify the 1st empty position
    addToRow = zeroPos(1);
end