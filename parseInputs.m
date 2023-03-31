function [particleDataMat, initialCondMat] = parseInputs(userInput)
%PARSEINPUTS Summary of this function goes here
%   Detailed explanation goes here

p_particle =  2;              % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
epsilon =     8.85e-12;       % Permittivity of Free Space (Assumed as permittivity of air)
q_particle =  1.602e-19;      % Charge of Particles (Assume only one electron attaches)
spacing =     0.1;            % distance of plates from each other (m)
V =           176;            % Voltage on Plate (Volts)
conc =        75;             % concentration of particles (ug/m^3)
mu =          1.81e-5;        % dynamic viscosity of air
diam =        5;              % Diameter of Particle (um)
maxAirspeed = 5;              % Maximum airspeed in center (m/s)

initialP =    0;              % Initial position of the particle (m)
initialV =    0;              % Initial velocity of the particle (m)

if(userInput)
    % get user input here
end



end

