function [] = separationLine(length, endSpace)

    % Default parameters when no parameter is provided
    arguments
        length = 90;
        endSpace = "true";
    end

    % Display the line separation made up of "length" amount of '_'
    display(repmat('_', 1, length));
    
    % If endSpace parameter is inputed as "true"
    if endSpace == "true"
        
        % Go down a line
        fprintf("\n");
    end
end