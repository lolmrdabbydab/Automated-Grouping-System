function [groupTable] = separate(groupTable, nameList, separateMatrix)

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

            % If the individual is already added in the groupTable
            if ismember(individual, groupTable)
                
                % Skip the individual (Don't add them again to groupTable)
                continue;
            end

            % Find a list of groups where the other member aren't in (can move to)
            teammateCountList = sum(ismember(groupTable, teammateList));
            groupWithoutTeammate = find(teammateCountList == 0);

            % Store which of those group that still got a spot for individual to join
            joinableGroupListIndex = find(sum(ismember(groupTable(:, groupWithoutTeammate), "0")) >= 1);
            joinableGroupList = groupWithoutTeammate(joinableGroupListIndex);
            
            % If there's no group the individual can join
            if isempty(joinableGroupList)

                % If individual only have 1 teammate to separate
                if length(teammateList) == 1
                    % Create warning message unable to separate the individual from that teammate
                    warnMessage = sprintf(strcat("\nUnable to Separate ", individual, " from ", teammateList(1), "\n"));

                % If individual have >1 teammate to separate
                else
                    % Create warning message unable to separate the individual from those teammate
                    warnMessage = sprintf(strcat("\nUnable to Separate ", individual, " from ", ...
                        strjoin(teammateList(1:end-1), ", "), " and ", teammateList(end), "\n"));
                end

                % Display the warning message
                warndlg(warnMessage, "Warning");
            
            % If there's group(s) the individual can join
            else
                % Call joinRandomGroup() with parameters to choose a random position on groupTable to join
                [addToRow, addToGroup] = joinRandomGroup(groupTable, joinableGroupList);
                
                % Add Individual to the position
                groupTable(addToRow, addToGroup) = individual;
            end
        end
    end

    % Find position of added individual
    deletePos = ismember(nameList, groupTable);
    
    % Remove them from nameList
    nameList(deletePos) = [];
    
    % Shuffle nameList
    nameList = nameList(randperm(length(nameList)));

    % Turn groupTable to a 1D array
    groupTableFlat = groupTable(:);

    % Add remaining names to "0"
    groupTableFlat(ismember(groupTableFlat, "0")) = nameList;

    % Reshape into matrix
    groupTable = reshape(groupTableFlat, size(groupTable));
end