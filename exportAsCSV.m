function [] = exportAsCSV(eventName, groupTable)
    % Create Name for CSV File
    csvName = char(string(eventName) + ".csv");
    
    % Export & Download CSV File
    writetable(groupTable, csvName);

    % Check if the file exists
    if isfile(csvName)
        
        % Display message saying Grouping has been Exported
        message = sprintf(strcat("\n", eventName, " Event Grouping Has Been Exported\n"));
        msgbox(message, "Exported Successfully", "help");
    else
        % Display message saying the file was not exported
        message = sprintf(strcat("\n", eventName, " Event Grouping Could Not Be Exported\n"));
        msgbox(message, "Export Failed", "error");
    end
end