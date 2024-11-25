clear; clc;
eventName = "Easter";

% -= Test Case 1 =- (Both, Empty Separation & Combination Team)
disp('Input: on off ' + ...
    '3 2 ' + ...
    'john mike cindy luke rick ken ' + ...
    'both' + ...
    'new none ' + ...
    'none ');
fprintf('Expected Output: \n' + ...
    '- 2 Initial Input Prompt\n' + ...
    '- essentialGroupInput()\n' + ...
    '- Com/Sep Input Instruction\n' + ...
    '- Input Prompt To Choose Combine/Separate/Both\n' + ...
    '- -= Combination List =-\n' + ...
    '- -= Separation List =-\n' + ...
    '- useExportCSV = Off\n' + ...
    '- groupTable = Matrix of zeros with dimension [indPerGroup, groupNum]\n' + ...
    '- Empty combineMatrix\n' + ...
    '- Empty separateMatrix\n');
disp("Actual Output:");
[groupTable, useExportCSV] = advance3(eventName);
fprintf("useExportCSV: %s\n", useExportCSV);
disp(groupTable);

pauser = input("Press Enter To Continue");
clc;

% -= Test Case 2 =- (Both, Separation & Combination Team with 1 Name)
disp('Input: on off ' + ...
    '3 2 ' + ...
    'john mike cindy luke rick ken ' + ...
    'both' + ...
    'john ' + ...
    'new ' + ...
    'cindy mike ' + ...
    'none ' + ...
    'cindy ' + ...
    'new ' + ...
    'mike john ' + ...
    'none ');
fprintf('Expected Output: \n' + ...
    '- 2 Initial Input Prompt\n' + ...
    '- essentialGroupInput()\n' + ...
    '- Com/Sep Input Instruction\n' + ...
    '- Input Prompt To Choose Combine/Separate/Both\n' + ...
    '- -= Combination List =-\n' + ...
    '- -= Separation List =-\n' + ...
    '- useExportCSV = Off\n' + ...
    '- groupTable = Matrix of zeros with dimension [indPerGroup, groupNum]\n' + ...
    '- combineMatrix: ["Cindy" "Mike"]\n' + ...
    '- separateMatrix: ["Mike" "John"]\n');
disp("Actual Output:");
[groupTable, useExportCSV] = advance3(eventName);
fprintf("useExportCSV: %s\n", useExportCSV);
disp(groupTable);

pauser = input("Press Enter To Continue");
clc;

% -= Test Case 3 =- (Both, Combine More Individual Than Group Size, Separate More Invidiual Than Number of Groups)
disp('Input: on off ' + ...
    '3 2 ' + ...
    'john mike cindy luke rick ken ' + ...
    'both' + ...
    'john mike cindy' + ...
    'none' + ...
    'cindy john mike luke' + ...
    'none ');
fprintf('Expected Output: \n' + ...
    '- 2 Initial Input Prompt\n' + ...
    '- essentialGroupInput()\n' + ...
    '- Com/Sep Input Instruction\n' + ...
    '- Input Prompt To Choose Combine/Separate/Both\n' + ...
    '- -= Combination List =-\n' + ...
    '- Cannnot group 3 people into group of 2 warning message\n' + ...
    '- -= Separation List =-\n' + ...
    '- Cannnot separate 4 people into group of 3 warning message' + ...
    '- useExportCSV = Off\n' + ...
    '- groupTable = Matrix of zeros with dimension [indPerGroup, groupNum]\n' + ...
    '- combineMatrix: ["John" "Mike"]\n' + ...
    '- separateMatrix: ["Cindy" "John" "Mike"]\n');
disp("Actual Output:");
[groupTable, useExportCSV] = advance3(eventName);
fprintf("useExportCSV: %s\n", useExportCSV);
disp(groupTable);