clear; clc;

% -= Test Case 1 =- (Normal Prompt without /n & /t)
prompt = "This is a test prompt";
waitTime = 0.05;

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: %s\n", prompt);
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");

% -= Test Case 2 =- (All Upper Case Prompt without /n & /t)
prompt = "THIS IS THE UPPER CASE TEST PROMPT";

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: %s\n", prompt);
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 3 =- (All Lower Case Prompt without /n & /t)
prompt = "this is the lower case test prompt";

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: %s\n", prompt);
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 4 =- (Prompt with \n)
prompt = "This is a test prompt \n with next line notation";

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: This is a test prompt \n with next line notation\n");
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 5 =- (Prompt with \t)
prompt = "This is a test prompt \t with tab notation";

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: This is a test prompt \t with tab notation\n");
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 6 =- (Prompt with \t & \n)
prompt = "This is a test prompt \n\t with next line and tab notation";

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.2f\n'], prompt, waitTime);
fprintf("Expected Output: This is a test prompt \n\t with next line and tab notation\n");
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 7 =- (Prompt with another positive waitTime)
prompt = "This is a test prompt with half a second waitTime";
waitTime = 0.5;

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %.1f\n'], prompt, waitTime);
fprintf("Expected Output: %s\n", prompt);
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 8 =- (Prompt with negative waitTime)
prompt = "This is a test prompt with -1 second waitTime";
waitTime = -1;

fprintf(['Input: \n\t' ...
    '- "%s"\n\t' ...
    '- %d\n'], prompt, waitTime);
fprintf("Expected Output: %s\n", prompt);
fprintf("Actual Output: ");
typingTextDisplay(waitTime, prompt);
fprintf("\n\n");


% -= Test Case 9 =- (No Prompt - Testing default values/arguments)
disp('Input: ""');
fprintf("Expected Output: No Prompt Received\n");
fprintf("Actual Output: ");
typingTextDisplay();