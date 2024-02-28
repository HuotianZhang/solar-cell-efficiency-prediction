function resultMatrix = GenerateEQE(OpticalGap, varargin)
     % Set default value for input2
    defaultEQE = 0.85; % default value

    % Check if input2 is provided
    if isempty(varargin)
        EQE = defaultEQE;
    else
        EQE = varargin{1};
    end
    % Generate the first column from 0.1 to 1 in 100 steps
    firstColumn = linspace(5, OpticalGap, 100)';
    
    % Create a column vector of 0.8s with the same number of rows
    secondColumn = EQE * ones(100, 1);
    
    % Concatenate the two columns to form a 100x2 matrix
    resultMatrix = [firstColumn, secondColumn];
end