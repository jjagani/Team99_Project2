function [particleDataMat, initialCondMat] = parseInputs(userInput)
%PARSEINPUTS Summary of this function goes here
%   Detailed explanation goes here

% density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
p_particle =  [2 2 1];

% Permittivity of Free Space (Assumed as permittivity of air)
epsilon =     [8.85e-12 8.85e-12 1];

% Charge of Particles (Assume only one electron attaches)
q_particle =  [1.602e-19 1.602e-19 1];

% distance of plates from each other (m)
spacing =     [0.1 0.1 1];

% Voltage on Plate (Volts)
V =           [176 176 1];

% concentration of particles (ug/m^3)
conc =        [75 75 1];

% dynamic viscosity of air
mu =          [1.8e-5 1.81e-5 1];

% Diameter of Particle (um)
diam =        [5 5 1];

% Maximum airspeed in center (m/s)
maxAirspeed = [5 5 1]; 

% Initial position of the particle (m)
initialP =    [0 0 1];

% Initial velocity of the particle (m/s)
initialV =    [0 0 1];

if(userInput)
    % get user input here
end
allRawData = [p_particle; epsilon; q_particle; spacing; conc; mu; diam; maxAirspeed; initialP; initialV];
allRawData


end

