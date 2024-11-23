clear; clc;

% -= Test Case 1 =- (Checking Correct groupTable randomization by comparing 
% 2 returned groupTable using same inputs)
fprintf("Input: \n\t" + ...
    "1st Time: 3 2 john cindy mike rick luke ken\n\t" + ...
    "2nd Time: 3 2 john cindy mike rick luke ken\n");
disp("Expected Output: 2 randomized matrixes of different names " + ...
    "arragements and has dimension 2x3.");

disp("Actual Output:");
for i = 1:2
    groupTable = simple1();
    fprintf("Group Table %d\n", i);
    disp(groupTable);
end