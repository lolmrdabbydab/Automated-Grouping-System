function [text] = title(text)

    % Remove any side-spacing & make the text into lowercase
    text = lower(strtrim(text));
    
    % Convert the first character of each word to uppercase
    text = regexprep(text, '(\<[a-z])', '${upper($1)}');

    % Turn character to string
    text = string(text);
end