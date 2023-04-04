clear;
clc;
close all;

%% == Model Inputs ==
% simulation data
tStart = 0;               % Start Time of Discretization
tEnd = 2;                 % End Time of Discretization
numSteps = 250;          % Number of Steps for ODE Solver
numPositionPoints = 50;   % Number of data points for the simulation to return for each particles path

% generate data matrix from other function
[particleDataMat, initCondMat] = parseInputs(0);

% setup timesteps
tDiscretized = linspace(tStart, tEnd, numSteps);

%% == Calculations ==

% get particle count from size of initial condition matrix
p_count = size(initCondMat,1);

% many particles simulation code
ultimateDataMatrix = zeros(p_count, 4, numPositionPoints); % all the outputs will go here underneath their respective columns
disp("== Inputs Generated ==")
for p = 1:p_count
    [tActual, h_position, h_velocity, v_position] = simParticle(particleDataMat(p,:), initCondMat(p,:), tDiscretized, numPositionPoints); 
    ultimateDataMatrix(p, 1, :) = tActual;
    ultimateDataMatrix(p, 2, :) = h_position;
    ultimateDataMatrix(p, 3, :) = h_velocity;
    ultimateDataMatrix(p, 4, :) = v_position;
    fprintf("\nParticle %d of %d simmed",p, p_count)
end

%% == Plots ==
fprintf("\n\n== Plotting ==")
plotParticles(ultimateDataMatrix)
fprintf("\n\n== Done ==\n")