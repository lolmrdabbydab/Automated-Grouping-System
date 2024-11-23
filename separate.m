function [groupTable] = separate1(groupTable, nameList, separateMatrix)

    % Iterate through each team
    for teamIndex = 1:size(separateMatrix, 1)
        
        % Store current team (list of names) into variable call team
        team = separateMatrix(teamIndex, :); 
        team(ismissing(team)) = []; % Remove <missing> to find true length

        % Iterate through each individuals
        for individualIndex = 1:length(team)
        
            % Store the individual name & a list of their separate teammate
            individual = team(individualIndex);
            teammateList = team(~ismember(team, individual));

            % Find a list of groups where the other member aren't in (can move to)
            teammateCountList = sum(ismember(groupTable, teammateList));
            joinableGroupList = find(teammateCountList == 0);
            
            % If there's no group the individual can join
            if isempty(joinableGroupList)
                
                % Display warning message unable to separate the individual
                warnMessage = sprintf(strcat("Unable to Separate ", individual, " from ", ...
                    strjoin(teammateList(1:end-1), ", "), " and ", teammateList(end)));
                warndlg(warnMessage, "Warning")
            else
                % Randomly choose a joinableGroupList
                [addToRow, addToGroup] = joinRandomGroup(groupTable, joinableGroupList);
                
                % Add Individual to the group
                groupTable(addToRow, addToGroup) = individual;
            end
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