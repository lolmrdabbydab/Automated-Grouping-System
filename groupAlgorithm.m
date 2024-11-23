clear; clc;

    % -= Welcome Message =-
setting = introductionMessage();

    % -= Main -=
% If setting is Simple
if setting == "Simple"

    % Receieve groupTable from simple()
    groupTable = simple();

    % Display Generated Grouping Table
    typingTextDisplay(0.05, "\n\t" + ...
        "-= Grouping Table =-" + ...
        "\n\n");
    disp(groupTable);

% If setting is Advance
else
    % Toggle Multiple Event
    useEvent = untilCorrectInput("Multiple Event: ", "s", ["On", "Off"]);

    separationLine(56);

    % If user want Multiple Event
    if useEvent == "On"

        % Ask for number of event
        numEvent = untilCorrectInteger("Number of Events: ", 2);
    else
        % Set number of event to 1
        numEvent = 1;
    end

    eventNameList = [];

    % Iterate through each event
    for event = 1:numEvent

        % If there's only 1 event
        if numEvent == 1

            % Ask for event name
            eventName = title(input("Name of Event: ", "s"));

        % If there's >1 event
        else
            % Ask for event name with index
            eventName = title(input("Name of Event No." + event + ": ", "s"));
        end

        % Store event name into list
        eventNameList = [eventNameList eventName];
    end

    clc;

    % Iterate through each Event
    for event = 1:numEvent

        % Get Event Name
        eventName = eventNameList(event);

        % Call on advance() to generate groupTable & return useExportCSV for event
        [groupTable, useExportCSV] = advance(eventName);

        % If user want to export grouping as CSV
        if useExportCSV == "On"

            % Call on exportAsCSV() to export CSV
            exportAsCSV(eventName, groupTable);

        % If user doesn't want to export groupings as CSV
        else
            % Display groupTable in command window
            typingTextDisplay(0.05, strcat("\n\t" + ...
                "-= ", eventName, " Event Preview =-" + ...
                "\n\n"));
            disp(groupTable);

            % If current event isn't the last event
            if event ~= numEvent

                % Using input, pause & allow user to manually proceed (Give time to view Preview)
                pauser = input("Press Enter To Continue");
            end
        end
    end
end
