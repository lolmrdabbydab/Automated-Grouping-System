function [groupTable, useExportCSV] = advance5(eventName)
       
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
        
        % Check which feature is selected
        if comORSep == "Combine"
            start = 1;
            stop = 1;
        elseif comORSep == "Separate"
            start = 2;
            stop = 2;
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
            repeat = false;
            breakOutLoop = false;

            % Use while-loop to receive correct input for Com/Sep Matrix
            while true
                
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
                            
                            % Return to start of while-loop for new input
                            continue;
                        end

                        % Reset Variable
                        indNum = 1;
                        teamNum = teamNum + 1;
                        newTeam = true;
                        fprintf("\n\n");

                        % Call removeInvalidTeam to remove team for either com/sep Matrix with only 1 name
                        if type == 1
                            combineMatrix = removeInvalidTeam(combineMatrix);
                        else
                            separateMatrix = removeInvalidTeam(separateMatrix);
                        end

                    % If user input is "None"
                    case "None"
                        fprintf("\n\n");

                        % Call removeInvalidTeam to remove team for either com/sep Matrix with only 1 name
                        if type == 1
                            combineMatrix = removeInvalidTeam(combineMatrix);
                        else
                            separateMatrix = removeInvalidTeam(separateMatrix);
                        end

                        % Break out of com/sep Matrix input loop
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
                        % If the user is combining & name input has already been inputted
                        if type == 1 && ismember(individualName, combineMatrix)
                            repeat = true;
                        end

                        % If user is separating & there's one or more individuals 
                        % in the team & if name input is already inputted
                        if ((indNum >= 2) && (type == 2)) && (ismember(individualName, separateMatrix(teamNum, :)))
                            
                            % Set Flag to True
                            repeat = true;
                        end

                        % If repeated input error found
                        if repeat
                            
                            % Display repeated input warning
                            warnMessage = sprintf("%s has already been added." + ...
                                "\nPrevious inputs can't be revoke. " + ...
                                "Please choose another individual.\n", individualName);
                            warndlg(warnMessage, "Warning");
                            
                            % Reset Flag
                            repeat = false;
                            
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
                            
                            % Put individual's potential teammate into a list
                            teamMateList = separateMatrix(teamNum, :);

                            % Make every 1x2 possible combination between every teammate & new individual 
                            for i = 1:length(teamMateList)
                                teammate = teamMateList(i);
                                pair = [individualName teammate];
                                
                                % Iterate through every row of combineMatrix
                                for row = 1:size(combineMatrix, 1)
                                    
                                    % If both individuals are in the same combine team
                                    if sum(ismember(pair, combineMatrix(row, :))) == 2

                                        % Display warning that can't separate indivduals inputted to be combine
                                        warnMessage = sprintf("You can't separate %s and %s because " + ...
                                            "they've been inputted to be group together.\n" + ...
                                            "Please choose another individual.\n", individualName, teammate);
                                        warndlg(warnMessage, "Warning");
                                        
                                        % Flag to break from nested for-loop to get to while-loop
                                        breakOutLoop = true;
                                        
                                        % Break out of for-loop
                                        break;
                                    end
                                end
                                
                                % If flag is true
                                if breakOutLoop
                                    
                                    % Break out of for-loop
                                    break;
                                end
                            end

                            % If flag is true
                            if breakOutLoop
                                
                                % Reset Flag
                                breakOutLoop = false;
                                
                                % Return to the top of while-loop
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
        disp("Combination Matrix");
        disp(combineMatrix);
        
        disp("Separation Matrix");
        disp(separateMatrix);

        % Call on a function with necessary parameters to receive the adjusted groupTable

        % Store temporary Group Names in groupNameList using for-loop

        % Change from Matrix to Table Form for better visual & to export as CSV
        % Add temporary group names to table
    
    % If user don't want to useComORSep
    else
        
        % Get the groupTable from simple()
        groupTable = simple();
    end

    % Display groupTable and ask user to enter group name
    
    % Ask for group name and store it in groupNameList using for-loop

    % Add groupName to groupNameList
    
    % Add new Group Name to Table
    
end