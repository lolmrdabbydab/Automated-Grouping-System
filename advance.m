function [groupTable, useExportCSV] = advance3(eventName)
       
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
            repeat = false;

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
                        
                            % Define a repeat input error is found

                        % If user is separating & there's one or more individuals 
                        % in the team & if name input is already inputted

                            % Define a repeat input error is found

                        % If repeated input error found

                            % Display repeated input warning

                            % Reset input error to not found

                            % Return to start of while-loop for new input


                        % If the user is separating & the input per individual cap is reached

                            % Display input cap reached warning for inputted indivdual

                            % Return to start of while-loop for new input

                        
                        % - Make sure individuals need to separate from each other isn't inputted to combine together -
                        % If user chose to both combine and separate & they're 
                        % separating & the input individual is not the 1st individual
                            
                            % Put individual's potential teammate into a list

                            % Make every 1x2 possible combination between every teammate & new individual 
                                
                                % Iterate through every row of combineMatrix
                                    
                                    % If both individuals are in the same combine team

                                        % Display warning that can't separate indivduals inputted to be combine

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
        disp("Combine Matrix");
        disp(combineMatrix);
        
        disp("Separate Matrix");
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