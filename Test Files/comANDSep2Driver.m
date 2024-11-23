clear; clc;

% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% Due to combineMatrix & separateMatrix will never be empty & will 
% never overlap, which filtered in advance() and the input filtration 
% has been tested in the advance file development, only different 
% types of valid input will be test here.
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

% -= Variable =-
nameList = ["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"];

% -= Test Case 1 =- (Multiple Combine Team & 1 Separate Team)
groupTable = string(zeros(3, 3));
combineMatrix = ["John" "Cindy"; "Tom" "Ian"];
separateMatrix = ["Ian" "Hans"];

fprintf(['Parameter: (string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"], ' ...
    '["John" "Cindy"; "Tom" "Ian"], ' ...
    '["Ian" "Hans"])\n']);
fprintf(['Expected Output: A 3x3 matrix of 0s where:\n\t' ...
    '- "John", "Cindy", "Tom" & "Ian" are the only four non-zero elements\n\t' ...
    '- "John" & "Cindy" are in the 1st column starting from the 1st row\n\t' ...
    '- "Tom" & "Ian" is added to a random column that is not the column "John" & "Cindy" are in\n\t' ...
    '- Name List: ["Mike" "Ken" "Luke" "Rick" "Hans"]\n']);
disp("Actual Output:");
groupTable = comANDSep2(groupTable, nameList, combineMatrix, separateMatrix);
disp("Group Table");
disp(groupTable);

% -= Test Case 2 =- (Too Much Combine Team Leaving No Room Other Combine Team)
groupTable = string(zeros(3, 3));
combineMatrix = ["John" "Cindy"; "Tom" "Ian"; "Rick" "Hans"; "Luke" "Mike"];
separateMatrix = ["John" "Tom"];
fprintf(['Parameter: (string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"], ' ...
    '["John" "Cindy"; "Tom" "Ian"; "Rick" "Hans"; "Luke" "Mike"], ' ...
    '["John" "Tom"])\n']);
fprintf(['Expected Output: A 3x3 matrix of 0s where:\n\t' ...
    '- "John", "Cindy", "Tom", "Ian", "Rick" & "Hans" are the only six non-zero elements\n\t' ...
    '- "John" & "Cindy" are in the 1st column starting from the 1st row\n\t' ...
    '- The column each Combine Team (except the first) is added to is random each time\n\t' ...
    '- No Combine Team is in the same column with one another\n\t' ...
    '- Error Message saying unable to combine "Luke" and "Mike" together\n\t' ...
    '- Name List: ["Mike" "Ken" "Luke"]\n']);
disp("Actual Output:");
groupTable = comANDSep2(groupTable, nameList, combineMatrix, separateMatrix);
disp(groupTable);