function [groupTable] = simple1()
    
    % -= Variables & Input =-
    % Call on essentialGroupInput() to receive basic inputs for grouping
    [numGroup, numIndPerGroup, nameList] = essentialGroupInput();
    groupNameList = [];

    % Randomize Name List
    nameList = nameList(randperm(length(nameList)));
    
    % Reshape nameList into a matrix using correct dimensions
    groupTable = reshape(nameList, numIndPerGroup, numGroup);

    % Iterate through each group
    
        % Add Group Name To groupNameList
        
    % Change from matrix to table (better visually) & add group name using groupNameList
end