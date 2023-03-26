<<<<<<< Updated upstream
function [posIC, velIC, accIC] = particleIC(width)
% Outputs the necessary initial conditions for one particle
%   Position in the x direction is parabolically randomized based on laminar
%   flow. Velocity in the x direction is zero to start. Acceleration in the
%   x direction is zero to start.
=======
function [posIC, velIC] = particleIC(width)
% Outputs the necessary initial conditions for one particle
%   Position in the x direction is parabolically randomized based on laminar
%   flow. Velocity in the x direction is zero to start.
>>>>>>> Stashed changes

% this finds a random float between 1 and 0 and then .5 is subtracted 
% from it
rawValue = rand(1,1) - .5;

% retains the sign of the value after squaring
if rawValue > 0 
    squareValue = rawValue^2;
elseif rawValue <= 0
    squareValue = -1 * (rawValue^2);
end

% applies the random number to the width of the plates
appliedValue = width * (2 * squareValue + .5);

posIC = appliedValue;
velIC = 0;
<<<<<<< Updated upstream
accIC = 0;
=======
>>>>>>> Stashed changes

end