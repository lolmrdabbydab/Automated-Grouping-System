function [] = typingTextDisplay(waitTime, prompt)
    
    % Default parameters when no parameters received
    arguments
        waitTime = 0.01;
        prompt = "No Prompt Received\n";
    end

    % Convert string propmt to character to access each index
    prompt = char(prompt);
    
    % Convert next line notation to unique symbol to prevent misrepresenting
    prompt = strrep(prompt, '\n', 'Ω');
    
    % Convert tab notation to unique symbol to prevent misrepresenting
    prompt = strrep(prompt, '\t', '√');

    % Loop through and print each character with a slight pause in between
    for i = 1:length(prompt)
        
        % If letter at index i is the symbol that replaces the next line notation
        if prompt(i) == 'Ω'
            fprintf("\n");

        % If the letter at index i is the symbol that replaces the tab notation
        elseif prompt(i) == '√'
            fprintf("\t");
        
        % Print the letter if otherwise
        else
            fprintf(prompt(i));
        end
        
        % Pause between every letter to give a typing effect
        pause(waitTime);
    end

end