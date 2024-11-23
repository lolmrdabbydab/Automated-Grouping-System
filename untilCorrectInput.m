function [userInput] = untilCorrectInput(prompt, type, conditionList)

    % While Loop Until Correct Input
    while true
        
        % Check for parameter type to use the correct input type
        % If type is "s", store a string input
        if type == "s"

            % Change string format to title
            userInput = title(input(prompt, "s"));

            % Change to same string format as userInput
            conditionList = title(conditionList);

        % If type isn't "s", store a numerical input
        else

            % Take in user input
            userInput = input(prompt);
        end
    
        % If userInput is in the conditionList (input is valid)
        if ismember(userInput, conditionList)
            
            % End function
            return;

        % If userInput isn't in the conditionList (invalid input)
        else
            % Display invalid input warning message & state what the 
            % correct input should be values in the conditionList
            warnMessage = sprintf("\n" + ...
                "Invalid Input. Please Try Again." + ...
                "\n" + ...
                "Input Should Be: ");
            
            % If there's more than 1 valid input
            if length(conditionList) > 1

                % Add the valid inputs in the correct format
                warnMessage = strcat(warnMessage, strjoin(conditionList(1:end-1), ", "), ...
                    " or ", string(conditionList(end)), ".");
            
            % If there's 1 correct input
            elseif length(conditionList) == 1
                
                % Add the valid input in the correct format
                warnMessage = strcat(warnMessage, string(conditionList(1)), ".");
            end
            
            % Display warnMessage
            warndlg(warnMessage, "Warning");
            fprintf("\n\n");
        end
    end
end