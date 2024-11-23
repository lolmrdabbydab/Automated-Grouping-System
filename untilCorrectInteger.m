function [num] = untilCorrectInteger(prompt, lowerBound)

    % Default parameters when no parameters received
    arguments
        prompt = "Enter a whole number larger than 1: ";
        lowerBound = 1;
    end

    % Ask for numerical input & store in variable num
    num = input(prompt);

    % If num isn't double, not real (imaginary number), isn't an integer & lower than lowerBound
    % Use while-loop to ask for another input until condition is satisfied
    while ~(length(num) == 1) || ~isnumeric(num) || ~isreal(num) || round(num) ~= num || num <= lowerBound - 1

        % Display a invalid numerical input warning
        warnMessage = sprintf("\nInvalid Input. Please Try Again" + ...
            "\n" + ...
            "Input should be a real, whole number larger than %d" + ...
            "\n", lowerBound - 1);
        warndlg(warnMessage, "Warning");
        
        % Ask for input again
        num = input(prompt);
    end
end