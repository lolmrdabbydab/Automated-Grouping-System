clear; clc;

% -= Test Functionality =- (No Parameters)
disp('Parameters: ()');
disp("Expected Output: _ displayed 90 times and the line goes down twice.");
disp("Actual Output:");
separationLine();


% -= Test Functionality =- (Parameters)
disp('Parameters: (5, "true")');
disp("Expected Output: _ displayed 5 times and the line goes down twice.");
disp("Actual Output:");
separationLine(5, "true");


% -= Test Functionality =- (No endSpace)
disp('Parameters: (5, "false")');
disp("Expected Output: _ displayed 5 times and the line goes down once.");
disp("Actual Output:");
separationLine(5, "false");
disp("Line starts here");

pauser = input("");


% -= Test Functionality =- (Negative Length)
disp('Parameters: (-1, "true")');
disp("Expected Output: Nothing");
disp("Actual Output:");
separationLine(-1, "true");


% -= Test Functionality =- (Float Length)
disp('Parameters: (0.5, "true")');
disp("Expected Output: Error.");
disp("Actual Output:");
separationLine(0.5, "true");