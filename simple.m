function [groupTable] = simple()
    
    % -= Variables & Input =-
    % Call on essentialGroupInput() to receive basic inputs for grouping
    [numGroup, numIndPerGroup, nameList] = essentialGroupInput();
    groupNameList = [];

    % Randomize Recieved Name List
    nameList = nameList(randperm(length(nameList)));
    
    % Reshape nameList into a matrix using correct dimensions
    groupTable = reshape(nameList, numIndPerGroup, numGroup);

    % Iterate through each group
    for column = 1:numGroup

       % Add group Name to groupNameList
       groupNameList = [groupNameList strcat("Group " + string(column))];
    end
        
    % Change from matrix to table (better visually) & add group name using groupNameList
    groupTable = array2table(groupTable, "VariableNames", groupNameList, "RowNames", {});
end