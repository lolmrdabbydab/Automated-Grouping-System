function [groupTable] = runComORSepFeature(comORSep, groupTable, nameList, combineMatrix, separateMatrix)
    
    % Check for parameter comORSep's value and store generated groupings into grouptable after
    % calling on the appropriate adjustment function using appropriate parameters
    % If comORSep is "Both", call on function comANDSep()
    if comORSep == "Both"
        groupTable = comANDSep(groupTable, nameList, combineMatrix, separateMatrix);
    
    % If comORSep is "Combine", call on function combine()
    elseif comORSep == "Combine"
        groupTable = combine(groupTable, nameList, combineMatrix);
    
    % else, call on function separate()
    else
        groupTable = separate(groupTable, nameList, separateMatrix);
    end

end