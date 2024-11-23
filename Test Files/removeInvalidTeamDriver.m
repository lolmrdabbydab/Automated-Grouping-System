clear; clc;

% -= Variable =-

% -= Test Case 1 =- (Normal Matrix)
matrix = ["Name 1" "Name 2";
    "Name 3" "Name 4"];

disp('Input: ["Name 1" "Name 2"; "Name 3" "Name 4"]');
disp('Expected Output: ["Name 1" "Name 2"; "Name 3" "Name 4"]');
disp("Actual Output: ");
matrix = removeInvalidTeam(matrix);
disp(matrix)

% -= Test Case 2 =- (Matrix With Last Row With 1 Value)
matrix = ["Name 1" "Name 2"];
matrix(2, 1) = "Name 3";

disp('Input: ["Name 1" "Name 2"; "Name 3" <missing>]');
disp('Expected Output: ["Name 1" "Name 2"]');
disp("Actual Output: ");
matrix = removeInvalidTeam(matrix);
disp(matrix)


% -= Test Case 3 =- (Empty Matrix)
matrix = string([]);

disp("Input: string([])");
disp("Expected Output: []");
disp("Actual Output: ");
matrix = removeInvalidTeam(matrix);
disp(matrix)
