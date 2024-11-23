clear; clc;

% -= Test Functionality & Correct Return Value =- 
% (Checking groupTable class is Table & has Group Name in ascending order)
disp("Input: 3 2 john cindy mike rick luke ken");
fprintf("Expected Output: \n\t" + ...
    "- class(groupTable): table\n\t" + ...
    "- groupTable: A randomized table of names with Group Names in " + ...
    "ascending order in (1st Row)/(VariableNames).");

disp("Actual Output:");
groupTable = simple();
fprintf("class(groupTable): %s\n", class(groupTable));
disp(groupTable);