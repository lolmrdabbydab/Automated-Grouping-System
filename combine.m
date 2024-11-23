function [groupTable] = combine1(groupTable, nameList, combineMatrix)

    % Store the firstTeam from combineMatrix
    firstTeam = combineMatrix(1, :);
    
    % Remove <missing>
    firstTeam(ismissing(firstTeam)) = [];

    % Add the first combine team into the 1st group in the table
    groupTable(1:length(firstTeam), 1) = firstTeam;
    
    % Iterate through each team and check which Group they can fit in
    for teamIndex = 2:size(combineMatrix, 1)
        
        % Store team's names into list called team
        team = combineMatrix(teamIndex, :);
        
        % Remove <missing>
        team(ismissing(team)) = [];

        % Create a list to put group the combine team can fit in
        groupCanFit = [];
    
        % Iterate through each group
        for group = 1:size(groupTable, 2)
            
            % Count empty space in each group
            spaceLeft = sum(ismember(groupTable(:, group), "0"));
    
            % If there's enough space for all team member
            if length(team) <= spaceLeft

                % Add group number to List
                groupCanFit = [groupCanFit group];
            end
        end
        
        % If there's no group the team can fit
        if isempty(groupCanFit)
            
            % Display warning message unable to combine the team's members together
            warnMessage = sprintf(strcat("Unable to Combine ", ...
                strjoin(team(1:end-1), ", "), " and ", team(end), " together."));
            warndlg(warnMessage, "Warning")
        else
            % Randomize the group number list & add the team into it
            [addToRow, addToGroup] = joinRandomGroup(groupTable, groupCanFit);
            groupTable(addToRow:addToRow + length(team) - 1, addToGroup) = team; % Add team to Group
        end
    end
    
    % Randomly add the remaining individual from nameList to Table

    % Find position of added individual
    
    % Remove them from nameList
    
    % Shuffle nameList

    % Turn groupTable to a 1D array

    % Add remaining names to "0"

    % Reshape into matrix

end