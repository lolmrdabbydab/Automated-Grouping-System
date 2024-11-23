function [numGroup, numIndPerGroup, nameList, groupTable] = essentialGroupInput()

    % -= Input & Variable =-
    % Call on untilCorrectInteger() to receive desired numerical input
    numGroup = untilCorrectInteger("Number of Groups: ", 2);
    numIndPerGroup = untilCorrectInteger("Number of Individuals per Group: ", 2);
    nameList = string([]);
    groupTable = string(zeros(numIndPerGroup, numGroup));

    separationLine(55);

    % Iterate through the amount of individuals input using numGroup*numIndPerGroup
    for indNum = 1:numGroup*numIndPerGroup

        % Ask for name input
        name = title(input("Enter Individual " + indNum + "'s Name: ", "s"));
        
        % If input name is already inputted, display warning
        while ismember(name, nameList)
            
            % Display warning message that the name has already been entered
            warnMessage = sprintf("The name %s has already been entered.\n" + ...
                "Please enter another name.\n", name);
            warndlg(warnMessage, "Warning");

            % Ask for name input again
            name = title(input("Enter Individual " + indNum + "'s Name: ", "s"));
        end
         
        % Add name to nameList
        nameList = [nameList name];
    end

    separationLine(55);
end