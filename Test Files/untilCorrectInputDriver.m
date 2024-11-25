clear; clc;

% -= Test Functionality =- (Input & conditionList with different Letter Case)
disp('Parameters: ("Animal Name: ", "s", ["cat" "DOG" "BeAR"])');
fprintf(['Input: \n\t' ...
    '- 1st Time: "CAT"\n\t' ...
    '- 2nd Time: "dog"\n\t' ...
    '- 3rd Time: "bEar"\n']);
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Animal Name: "\n\t' ...
    '- userInput1: "Cat"\n\t' ...
    '- userInput2: "Dog"\n\t' ...
    '- userInput3: "Bear"\n']);
userInput1 = untilCorrectInput("Name: ", "s", ["cat" "DOG" "BeAR"]);
userInput2 = untilCorrectInput("Name: ", "s", ["cat" "DOG" "BeAR"]);
userInput3 = untilCorrectInput("Name: ", "s", ["cat" "DOG" "BeAR"]);
fprintf(['Actual Output: \n\t' ...
    '- userInput1: "%s"\n\t' ...
    '- userInput2: "%s"\n\t' ...
    '- userInput3: "%s"\n\n'], userInput1, userInput2, userInput3);

% -= Test Functionality =- (Wrong Input)
disp('Parameters: ("Animal Name: ", "s", ["Cat" "Dog" "Bear"])');
fprintf('Input: "cas" "cat"\n\t');
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Animal Name: "\n\t' ...
    '- Warning Message\n\t' ...
    '- userInput: "Cat"\n']);
userInput = untilCorrectInput("Name: ", "s", ["cat" "DOG" "BeAR"]);
fprintf(['Actual Output: \n\t' ...
    '- userInput: "%s"\n\n'], userInput);


% -= Test Case 1 =- (1 Valid Input)
disp('Parameters: ("Animal Name: ", "s", ["Dog"])');
disp('Input: "dog"');
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Animal Name: "\n\t' ...
    '- userInput: "Dog"\n']);
userInput = untilCorrectInput("Name: ", "s", ["Dog"]);
fprintf('Actual Output: "%s"\n\n', userInput);


% -= Test Case 2 =- (Side spaces & Spaces in conditionList element)
disp('Parameters: ("Animal Name: ", "s", ["A cat" " Dog "])');
fprintf(['Input: \n\t' ...
    '- userInput1: "a cat"\n\t' ...
    '- userInput2: "dog"\n']);
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Animal Name: "\n\t' ...
    '- userInput1: "A Cat"\n\t' ...
    '- userInput2: "Dog"\n']);
userInput1 = untilCorrectInput("Name: ", "s", ["A cat" " Dog   "]);
userInput2 = untilCorrectInput("Name: ", "s", ["A cat" " Dog   "]);
fprintf(['Actual Output: \n\t' ...
    '- userInput1: "%s"\n\t' ...
    '- userInput2: "%s"\n\n'], userInput1, userInput2);

% -= Test Case 3 =- (Integer Parameter & Input)
disp('Parameters: ("Enter a Number: ", "o", [1 10 100 1000])');
disp("Input: 10");
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Enter a Number (2 decimal places): "\n\t' ...
    '- userInput: 10\n']);
userInput = untilCorrectInput("Enter a Number: ", "o", [1 10 100 100]);
fprintf("Actual Output: %d\n\n", userInput);

% -= Test Case 3 =- (Float Parameter & Input)
disp('Parameters: ("Enter a Number (2 decimal places): ", "o", [1.0 10.0 100.0 1000.0])');
disp("Input: 10.00");
fprintf(['Expected Output: \n\t' ...
    '- Input Prompt: "Enter a Number (2 decimal places): "\n\t' ...
    '- userInput: "10.00"\n']);
userInput = untilCorrectInput("Enter a Number (2 decimal places): ", "o", [1.0 10.0 100.0 1000.0]);
fprintf("Actual Output: %.2f\n", userInput);