clear; clc;

% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% comORSep, groupTable, nameList, combineMatrix & separateMatrix will never
% be empty because of the input filtration in advance() which is tested 
% in advanceDriver() so we will only be testing with valid parameters
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

% -= Variables =-
comORSep = "Both";
groupTable = string(zeros(3, 3));
nameList = ["John" "Cindy" "Mike" "Ken" "Rick" "Henry" "Walt" "Tom" "Hans"];
combineMatrix = ["Cindy" "John"];
separateMatrix = ["Mike" "Walt" "Tom"];


% -= Test Functionality =- (Valid Parameter)
fprintf(['Parameter: ("On", ' ...
    'string(zeros(3, 3)), ' ...
    '["John" "Cindy" "Mike" "Ken" "Rick" "Henry" "Walt" "Tom" "Hans"], \n' ...
    '["Cindy" "John"], ' ...
    '["Mike" "Walt" "Tom"])\n\n']);
fprintf(['Expected Output: A 3x3 Matrix where "John" & "Cindy" is in the first \n' ...
    '2 row in 1st column/group, "Mike" & "Walk" & "Tom" are in separate columns \n' ...
    'which means any one of them would be in the same column as "John" & "Cindy" \n' ...
    'then the rest of the matrix is randomly filled with the rest of the names in nameList.\n\n']);
disp("Actual Output:");
groupTable = runComORSepFeature(comORSep, groupTable, nameList, combineMatrix, separateMatrix);
disp(groupTable);