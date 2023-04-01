function [particleDataMat, initialCondMat] = parseInputs(userInput)
%% == Hardcoded Values ==
%% each variable is of the form [start end number of values]
%% (so to keep it constant, do x = [constant, constant, 1])
% density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
p_particle =  [2 2 1];

% Permittivity of Free Space (Assumed as permittivity of air)
epsilon =     [8.85e-12 8.85e-12 1];

% Charge of Particles (Assume only one electron attaches)
q_particle =  [3.84e-12 3.84e-12 1];

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
initialP =    [0 .09 10];

% Initial velocity of the particle (m/s)
initialV =    [0 0 1];

if(userInput)
    % get user input here
end

parsedDataMat = 0;

rawInputs = [p_particle; epsilon; q_particle; spacing; V; conc; mu; diam; maxAirspeed; initialP; initialV];

%% == expand parsedDataMat ==
% turn it into a matrix where each row represents one particle, and there
% are engough rows to cover every possible combination of the inputs
for i=1:length(rawInputs)
    rawSingleInput = rawInputs(i,:);
    spacedVals = linspace(rawSingleInput(1), rawSingleInput(2), rawSingleInput(3));
    repSpacedVals = repelem(spacedVals, size(parsedDataMat,1));

    parsedDataMat = repmat(parsedDataMat, length(spacedVals), 1);
    parsedDataMat(:,i) = repSpacedVals;
end

% return values
particleDataMat = parsedDataMat(:,1:9);
initialCondMat = parsedDataMat(:,10:11);
end

