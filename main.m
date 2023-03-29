clear;
clc;
close all;


tStart = 0;               % Start Time of Discretization
tEnd = 10;                 % End Time of Discretization
numSteps = 1000;         % Number of Steps for ODE Solver
particle_diameter = 2.5;  % Particle Diameter (um)
numPositionPoints = 50;  % Number of points to plot along position graph

%% == Model Inputs ==
p_particle =  2;              % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
epsilon =     8.85e-12;       % Permittivity of Free Space (Assumed as permittivity of air)
q_particle =  1.602e-19;      % Charge of Particles (Assume only one electron attaches)
spacing =     0.1;            % distance of plates from each other (m)
V =           176;            % Voltage on Plate (Volts)
conc =        75;             % concentration of particles (ug/m^3)
mu =          1.81e-5;        % dynamic viscosity of air
diam =        5;             % Diameter of Particle (um)
maxAirspeed = 5;              % Maximum airspeed in center (m/s)

particleData = [p_particle epsilon q_particle spacing V conc mu diam maxAirspeed];
tDiscretized = linspace(tStart, tEnd, numSteps);

%% == Calculations ==

% many particles simulation code
p_count = 2; % amount of particles you want to run
ultimateDataMatrix = zeros(p_count, 4, numSteps); % all the outputs will go here underneath their respective columns

for pIndex = 1:p_count
    %initialConditions = particleIC(spacing); % uses the initial condition function to randomize position
    [tDiscretized, h_position, h_velocity, v_position] = simParticle(particleData, [0 0], tDiscretized); 
    ultimateDataMatrix(pIndex, 1, :) = tDiscretized;
    ultimateDataMatrix(pIndex, 2, :) = h_position;
    ultimateDataMatrix(pIndex, 3, :) = h_velocity;
    ultimateDataMatrix(pIndex, 4, :) = v_position;
end

%% == Plots ==
plotParticles(ultimateDataMatrix)