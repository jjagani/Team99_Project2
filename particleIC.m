function [posIC, velIC, accIC] = particleIC(width)
% Outputs the necessary initial conditions for one particle
%   Position in the x direction is normally randomized based on laminar
%   flow. Velocity in the x direction is zero to start. Acceleration in the
%   x direction is zero to start.
posIC = normrnd(width / 2, %standard deviation goes here)
posIC = ;
velIC = 0;
accIC = 0;
end