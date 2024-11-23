function [groupTable] = comANDSep(groupTable, nameList, combineMatrix, separateMatrix)

    % Take first combine team from combineMatrix and store it into a list
    firstTeam = combineMatrix(1, :);
    
    % Remove <missing>
    firstTeam(ismissing(firstTeam)) = [];

    % Add the first combine team into the 1st group in the table
    groupTable(1:length(firstTeam), 1) = firstTeam;

    % Iterate through each team and check which Group they can fit in
    for teamIndex = 2:size(combineMatrix, 1)
        
        % Select the combine team
        teamCom = combineMatrix(teamIndex, :);
        
        % Remove <missing>
        teamCom(ismissing(teamCom)) = [];

        % Create a list to store group the team can join
        groupCanJoin = [];
    
        % Iterate through each group
        for groupIndex = 1:size(groupTable, 2)
            
            % Identify each group
            group = groupTable(:, groupIndex);
             
            % Record the amount of empty space in each group
            spaceLeft = sum(ismember(groupTable(:, groupIndex), "0")); 
    
            % If that group has enough space for the Combine Team
            if length(teamCom) <= spaceLeft
                
                % Add group number to groupCanJoin List
                groupCanJoin = [groupCanJoin groupIndex];
                
                % If the group isn't empty
                if spaceLeft < length(groupTable(:, groupIndex))
                
                    % Iterate through all separate team
                    for i = 1:size(separateMatrix, 1)
                        
                        % Record number of members in Combine Team that's in that Separate Team
                        teamInSepCount = sum(ismember(teamCom, separateMatrix(i, :)));

                        % Record number of members in the current Group that's in that Separate Team
                        groupInSepCount = sum(ismember(group, separateMatrix(i, :)));
                        
                        % --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
                        %   Use == 1 because input doesn't allow adding 2 people in a combine 
                        %   team in the same separate team
                        % --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
                        % Compare if Combine Team & Group has any members that must be separated
                        if (teamInSepCount == 1) && (groupInSepCount == 1)
                            
                            % Removed Group from groupCanJoin
                            groupCanJoin = groupCanJoin(1 : end-1);
                        end
                    end
                end
            end
        end
        
        % If there's no group the teamCom can fit
        if isempty(groupCanJoin)
            
            % Display warning message unable to combine the team's members together
            warnMessage = sprintf(strcat("Unable to Combine ", ...
                strjoin(teamCom(1:end-1), ", "), " and ", teamCom(end), " together."));
            warndlg(warnMessage, "Warning")
        
        % If there's group the teamCom can fit
        else
            % Randomize groupCanJoin list & add the team into it
            [addToRow, addToGroup] = joinRandomGroup(groupTable, groupCanJoin);

            % Add team to 1st empty position in Group
            groupTable(addToRow:addToRow + length(teamCom) - 1, addToGroup) = teamCom;
        end
    end
    
    % Identify the individuals that has been added to groupTable
    deletePos = ismember(nameList, groupTable);
    
    % Remove individuals added to groupTable from nameList
    nameList(deletePos) = [];
    
    % Call on separate() to add the rest of the individuals from nameList to groupTable
    groupTable = separate(groupTable, nameList, separateMatrix);
end
