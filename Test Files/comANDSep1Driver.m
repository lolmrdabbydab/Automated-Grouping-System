clear; clc;

% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% Due to combineMatrix & separateMatrix will never be empty & will 
% never overlap, which filtered in advance() and the input filtration 
% has been tested in the advance file development, only different 
% types of valid input will be test here.
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

% -= Variable =-
nameList = ["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"];

% -= Test Case 1 =- (1 Combine Team & 1 Separate Team)
groupTable = string(zeros(3, 3));
combineMatrix = ["John" "Cindy"];
separateMatrix = ["Ian" "Hans"];

fprintf(['Parameter: (string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"], ' ...
    '["John" "Cindy"], ' ...
    '["Ian" "Hans"])\n']);
fprintf(['Expected Output: A 3x3 matrix of 0s where:\n\t' ...
    '- "John" & "Cindy" are the only two non-zero elements\n\t' ...
    '- "John" & "Cindy" are in the 1st column starting from the 1st row\n']);
disp("Actual Output:");
groupTable = comANDSep1(groupTable, nameList, combineMatrix, separateMatrix);
disp("Group Table");
disp(groupTable);


% -= Test Case 2 =- (Multiple Combine Team & Multiple Separate Team)
groupTable = string(zeros(3, 3));
combineMatrix = ["John" "Cindy"; "Tom" "Ian"];
separateMatrix = ["Ian" "Hans"; "Cindy" "Ian"];

fprintf(['Parameter: (string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"], ' ...
    '["John" "Cindy"; "Tom" "Ian"], ' ...
    '["Ian" "Hans"; "Cindy" "Ian"])\n']);
fprintf(['Expected Output: A 3x3 matrix of 0s where:\n\t' ...
    '- "John" & "Cindy" are the only two non-zero elements\n\t' ...
    '- "John" & "Cindy" are in the 1st column starting from the 1st row\n\t' ...
    '- Combine Team: ["Tom" "Ian"]\n\t' ...
    '- Group Can Join: [2 3]\n']);
disp("Actual Output:");
groupTable = comANDSep1(groupTable, nameList, combineMatrix, separateMatrix);
disp("Group Table");
disp(groupTable);


% -= Test Case 2 =- (Different Length Combine Team & Separate Team)
groupTable = string(zeros(3, 3));
combineMatrix = ["John" "Cindy"; "Tom" "Ian"; "Rick" "Ken"];
separateMatrix = ["Ian" "Hans"];

fprintf(['Parameter: (string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Luke" "Rick" "Hans" "Tom" "Ian"], ' ...
    '["John" "Cindy"; "Tom" "Ian"; "Rick" "Ken"], ' ...
    '["Ian" "Hans"])\n']);
fprintf(['Expected Output: A 3x3 matrix of 0s where:\n\t' ...
    '- "John" & "Cindy" are the only two non-zero elements\n\t' ...
    '- "John" & "Cindy" are in the 1st column starting from the 1st row\n\t' ...
    '- Combine Team: ["Tom" "Ian"]\n\t' ...
    '- Group Can Join: [2 3]\n\t' ...
    '- Combine Team: ["Rick" "Ken"]\n\t' ...
    '- Group Can Join: [2 3]\n']);
disp("Actual Output:");
groupTable = comANDSep1(groupTable, nameList, combineMatrix, separateMatrix);
disp("Group Table");
disp(groupTable);