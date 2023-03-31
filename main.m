clear;
clc;
close all;

%% == Model Inputs ==
% simulation data
tStart = 0;               % Start Time of Discretization
tEnd = 2;                 % End Time of Discretization
numSteps = 1000;          % Number of Steps for ODE Solver
numPositionPoints = 50;   % Number of data points for the simulation to return for each particles path
p_count = 100; % amount of particles you want to run

%% particle data
%p_particle =  2;              % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
%epsilon =     8.85e-12;       % Permittivity of Free Space (Assumed as permittivity of air)
%q_particle =  1.602e-19;      % Charge of Particles (Assume only one electron attaches)
%spacing =     0.1;            % distance of plates from each other (m)
%V =           176;            % Voltage on Plate (Volts)
%conc =        75;             % concentration of particles (ug/m^3)
%mu =          1.81e-5;        % dynamic viscosity of air
%diam =        5;              % Diameter of Particle (um)
%maxAirspeed = 5;              % Maximum airspeed in center (m/s)

%% == Process inputs ==
% turn particleData into a matrix with a row for each particle
%particleData = [p_particle epsilon q_particle spacing V conc mu diam maxAirspeed];
%particleDataMat = repmat(particleData, p_count, 1);
%
%particleDataMat(:,9) = repmat(linspace(1,10,10), 1, 10);
%
%% turn initialConditions into a matrix with a row for each particle
%initialConditions = [0 0];
%initCondMat = repmat(initialConditions, p_count, 1);
%
%initCondMat(:,1) = repelem(linspace(0,spacing, 10),10);

[particleDataMat, initCondMat] = parseInputs(0);

% setup timesteps
tDiscretized = linspace(tStart, tEnd, numSteps);

%% == Calculations ==

% many particles simulation code
ultimateDataMatrix = zeros(p_count, 4, numPositionPoints); % all the outputs will go here underneath their respective columns

for p = 1:p_count
    [tActual, h_position, h_velocity, v_position] = simParticle(particleDataMat(p,:), initCondMat(p,:), tDiscretized, numPositionPoints); 
    ultimateDataMatrix(p, 1, :) = tActual;
    ultimateDataMatrix(p, 2, :) = h_position;
    ultimateDataMatrix(p, 3, :) = h_velocity;
    ultimateDataMatrix(p, 4, :) = v_position;
end

%% == Plots ==
plotParticles(ultimateDataMatrix)