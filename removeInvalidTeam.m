function [inputMatrix] = removeInvalidTeam(inputMatrix)

    % If the parameter matrix isn't empty (Has at least a name in it)
    if ~isempty(inputMatrix)

        % Store last team in list call lastTeam
        lastTeam = inputMatrix(end, :);

        % Remove <missing> to find true length
        lastTeam(ismissing(lastTeam)) = [];
        
        % If the last team only has 1 individual
        if length(lastTeam) == 1
            
            % Remove last team from matrix
            inputMatrix = inputMatrix(1:end-1, :);
        end
    end
end