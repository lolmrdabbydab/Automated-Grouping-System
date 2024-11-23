function [groupTable, useExportCSV] = advance(eventName)

    clc;
    
    % Take user input on whether they want to use Combine/Separate & Export as CSV Feature
    typingTextDisplay(0.02, strcat('Please toggle (on/off) the following features for the "', eventName, ' Event"\n'));
    useComORSep = untilCorrectInput("Combination/Separation: ", "s", ["On", "Off"]);
    useExportCSV = untilCorrectInput("Export Event As CSV: ", "s", ["On" "Off"]);

    separationLine();

    % Display information entering prompt
    typingTextDisplay(0.02, strcat("Please enter the following information for the -= ", eventName, " Event =-\n\n"));

    % If the user wants to useComORSep
    if useComORSep == "On"
        
        % Call essentialGroupInput for Data & Variable
        [numGroup, numIndPerGroup, nameList, groupTable] = essentialGroupInput();
        combineMatrix = string([]);
        separateMatrix = string([]);
        
        % Explain Input System
        typingTextDisplay(0.02, "Initializing Combination/Separation Feature");
        typingTextDisplay(1, " ...");
        typingTextDisplay(0.02, ['\n\n\t' ...
            '- Input Instruction -' ...
            '\n' ...
            'For certain individuals to be group together, input each name and press ENTER.' ...
            '\n' ...
            'To start a new set of individuals (called team) that should be group together, type "new".' ...
            '\n' ...
            'When finish, type "none".' ...
            '\n' ...
            'The input format for separation is the same.' ...
            '\n\n']);
        separationLine();

        % Ask which feature is the user want to use
        comORSep = untilCorrectInput('Select the feature you will use (Combine/Separate/Both): ', "s", ["Combine", "Separate", "Both"]);
        
        % Check which feature is selected & set loop variables
        % If the user wants to combine
        if comORSep == "Combine"
            start = 1;
            stop = 1;
        
        % If the user wants to separate
        elseif comORSep == "Separate"
            start = 2;
            stop = 2;
        
        % If the user wants both combine & separate
        else
            start = 1;
            stop = 2;
        end

        % Iterate once or twice based on selected comORSep feature
        for type = start:stop

            if type == 1
                typingTextDisplay(0.02, "\n-= Combination List =-\n");
            else
                typingTextDisplay(0.02, "\n-= Separation List =-\n");
            end

            % Variables
            indNum = 1;
            teamNum = 1;
            newTeam = true;

            % Use while-loop to receive correct input for Com/Sep Matrix
            while true

                % Flag
                invalidSeparation = false;
                
                % Display team number when a new team is created
                if newTeam
                    typingTextDisplay(0.02, strcat("Individuals in Team No. ", string(teamNum), "\n\n"));
                    newTeam = false;
                end

                % Ask for individualName or command to proceed
                individualName = untilCorrectInput("Individual "+ indNum + "'s Name: ", "s", [nameList "New" "None"]);

                % Check user input
                switch individualName
                    
                    % If user input is "New"
                    case "New"

                        % If the number of separate team exceed number of groups avaliable
                        if (type == 2) && (teamNum == numGroup)

                            % Display warning team cap reached
                            warnMessage = sprintf("Due to program complexity limitations, there " + ...
                                "can only be %d separation team. Please enter 'none' to " + ...
                                "continue.\n", teamNum);
                            warndlg(warnMessage, "Warning");
                            continue;
                        end

                        % If the user is combining
                        if type == 1
                            
                            % Call removeInvalidTeam to remove current team if there's less than 2 names in it
                            combineMatrix = removeInvalidTeam(combineMatrix);

                            % If the returned combineMatrix is empty
                            if isempty(combineMatrix)
                                
                                % Reset Variable
                                indNum = 1;
                                newTeam = true;

                                % Display Insufficient Inputs Warning Message
                                warnMessage = sprintf("\nThe amount of name entered into Team No. %d is insufficient to combine.\n" + ...
                                    "Please enter at least 2 individual's name.\n", teamNum);
                                warndlg(warnMessage, "Warning");
                                fprintf("\n\n");
                                
                                % Return to top of while-loop
                                continue;
                            end
                        
                        % If the user is separating
                        else
                            % Call removeInvalidTeam to remove team for either com/sep Matrix with only 1 name
                            separateMatrix = removeInvalidTeam(separateMatrix);
                            
                            % If separateMatrix is empty
                            if isempty(separateMatrix)
                                
                                % Reset Variable
                                indNum = 1;
                                newTeam = true;

                                % Display Warning Message That The List Can't Be Empty
                                warnMessage = sprintf("\nThe amount of name entered into Team No. %d is insufficient to separate.\n" + ...
                                    "Please enter at least 2 individual's name.\n", teamNum);
                                warndlg(warnMessage, "Warning");
                                fprintf("\n\n");
                                
                                % Return to top of while-loop
                                continue;
                            end
                        end

                        % Reset Variable & Increase Team Count
                        indNum = 1;
                        teamNum = teamNum + 1;
                        newTeam = true;
                        fprintf("\n\n");

                    % If user input is "None"
                    case "None"
                        
                        % If the user is combining
                        if type == 1
                            
                            % Call removeInvalidTeam to remove team for either com/sep Matrix with only 1 name
                            combineMatrix = removeInvalidTeam(combineMatrix);

                            % If combineMatrix is empty
                            if isempty(combineMatrix)
                                
                                % Reset Variable
                                indNum = 1;

                                % Display Warning Message That It Can't Be Empty
                                warnMessage = sprintf("\nThe amount of name entered into Combination List is insufficient to combine.\n" + ...
                                    "Please enter at least 2 individual's name.\n");
                                warndlg(warnMessage, "Warning");
                                
                                % Return to top of while-loop
                                continue;
                            end
                        
                        % If the user is separating
                        else
                            % Call removeInvalidTeam to remove team for either com/sep Matrix with only 1 name
                            separateMatrix = removeInvalidTeam(separateMatrix);
                            
                            % If separateMatrix is empty
                            if isempty(separateMatrix)
                                
                                % Reset Variable
                                indNum = 1;

                                % Display Warning Message That The List Can't Be Empty
                                warnMessage = sprintf("\nThe amount of name entered into Separation List is insufficient to separate.\n" + ...
                                    "Please enter at least 2 individual's name.\n");
                                warndlg(warnMessage, "Warning");
                                 
                                % Return to top of while-loop
                                continue;
                            end
                        end
                        
                        % Break out of com/sep Matrix input loop
                        fprintf("\n\n");
                        break;

                    % If the input is not "New" nor "None"
                    otherwise
                        % - Limit number of input based on scenario -
                        % If user want to combine more people than a group can house
                        if (type == 1) && (indNum > numIndPerGroup)

                            % Display input limit warning
                            warnMessage = sprintf("You can't combine " + indNum + ...
                                " people into a group of " + numIndPerGroup + ...
                                ". Previous inputs can't be revoke. " + ...
                                "Please enter 'new' or 'none' to proceed.\n");
                            warndlg(warnMessage, "Warning");
                            
                            % Return to start of while-loop for new input
                            continue;
                        
                        % If user want to separate more people from each other
                        % than the amount of groups there are
                        elseif (type == 2) && (indNum > numGroup)

                            % Display input limit warning
                            warnMessage = sprintf("You can't separate " + indNum +...
                                " people into " + numGroup + " groups. " + ...
                                "Previous inputs can't be revoke. " + ...
                                "Please enter 'new' or 'none' to proceed.\n");
                            warndlg(warnMessage, "Warning");
                            
                            % Return to start of while-loop for new input
                            continue;
                        end
                        
                        % - Make sure user can't input the same name depending on the scenario -
                        % If the user is combining & name input has already
                        % been inputted OR if user is separating & there's one or more individuals 
                        % in the team and that the name input is already inputted
                        if (type == 1 && ismember(individualName, combineMatrix)) || (indNum >= 2 && type == 2 && ismember(individualName, separateMatrix(teamNum, :)))
                            
                            % Display repeated input warning
                            warnMessage = sprintf("%s has already been added." + ...
                                "\nPrevious inputs can't be revoke. " + ...
                                "Please choose another individual.\n", individualName);
                            warndlg(warnMessage, "Warning");
                            
                             % Return to start of while-loop for new input
                            continue;
                        end


                        % If the user is separating & the input per individual cap is reached
                        if (type == 2) && sum(sum(count(separateMatrix, individualName))) == (numGroup - 1)
                            
                            % Display warning input cap reached for inputted indivdual
                            warnMessage = sprintf("Due to program complexity limitations, %s " + ...
                                "can only be inputted %d times. Please enter 'new' or 'none' to " + ...
                                "continue.\n", individualName, numGroup - 1);
                            warndlg(warnMessage, "Warning");
                            
                            % Return to start of while-loop for new input
                            continue;
                        end
                        
                        % - Make sure individuals need to separate from each other isn't inputted to combine together -
                        % If user chose to both combine and separate & they're 
                        % separating & the input individual is not the 1st individual
                        if ((comORSep == "Both") && (type == 2)) && (indNum >= 2)
                            
                            % Put individual's Separate Teammate into a list
                            teamMateList = separateMatrix(teamNum, :);

                            % Make every 1x2 possible combination between every teammate & new individual 
                            for i = 1:length(teamMateList)
                                teammate = teamMateList(i);
                                pair = [individualName teammate];

                                % If both individuals are in the same combine team
                                if ~isempty(find(sum(ismember(combineMatrix, pair), 2) == 2))

                                    % Display warning that can't separate indivduals inputted to be combine
                                    warnMessage = sprintf("You can't separate %s and %s because " + ...
                                        "they've been inputted to be group together.\n" + ...
                                        "Please choose another individual.\n", individualName, teammate);
                                    warndlg(warnMessage, "Warning");
                                    
                                    % Set flag to True
                                    invalidSeparation = true;
                                    
                                    % Break out of for-loop
                                    break;
                                end
                            end

                            % If flag is true
                            if invalidSeparation
                                
                                % Return to start of while-loop for new input
                                continue;
                            end
                        end

                        % Add individual to correct matrix
                        if type == 1
                            combineMatrix(teamNum, indNum) = individualName;
                        else
                            separateMatrix(teamNum, indNum) = individualName;
                        end

                        % Increment indNum by 1 after adding individual
                        indNum = indNum + 1;
                end 
            end
        end

        % Call on runComORSepFeature() with necessary parameters to receive the adjusted groupTable
        groupTable = runComORSepFeature(comORSep, groupTable, nameList, combineMatrix, separateMatrix);

        % Create a list called groupNameList to store temporary group name
        groupNameList = [];

        % Iterate through each group
        for i = 1:size(groupTable, 2)

            % Store temporary Group Name in groupNameList
            groupNameList = [groupNameList strcat("Group ", string(i))]; 
        end

        % Turn Matrix into Table for better visual, export as CSV & add temporary group names to table
        groupTable = array2table(groupTable, "VariableNames", groupNameList, "RowNames", {});
    
    % If user don't want to useComORSep
    else
        % Get the groupTable from simple()
        groupTable = simple();
        numGroup = size(groupTable, 2);
    end

    % Display groupTable and ask user to enter group name
    typingTextDisplay(0.02, strcat("Please Enter The Name For Each Group For The ", eventName, " Event:\n\n"))
    disp(groupTable)
    
    % Create a list called groupNameList to store temporary group name
    groupNameList = [];

    % Iterate through each group
    for group = 1:numGroup

        % Ask for groupName input
        groupName = title(input("Enter Name for Group " + group + ": ", "s"));
        
        % If groupName has been used, using while-loop, ask until a different name is inputted
        while (group > 1) && ismember(groupName, groupNameList)

            % Display warning that groupName is already used
            warnMessage = sprintf("\nGroup Name '%s' Had Already Been Use. " + ...
                "Please Enter Another Name.\n", groupName);
            warndlg(warnMessage, "Warning");

            % Ask for another groupName
            groupName = title(input("Enter Name for Group " + group + ": ", "s"));
        end

        % Add groupName to groupNameList
        groupNameList = [groupNameList groupName];
    end
    
    % Add new Group Names to Table
    groupTable.Properties.VariableNames = groupNameList;
    
    separationLine(55);
end