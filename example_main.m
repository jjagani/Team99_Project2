clear;
clc;

% Define your starting time, ending time, and # of discretized times
tStart = 0;
tEnd = 1;
numSteps = 5000;
tDiscretized = linspace(tStart, tEnd, numSteps);

% Define your initial conditions
thetaInit = 0.9*pi; omegaInit = 0;

% This step does the actual integrating; derivFunc is explained below
[t,soln] = ode45(@derivFunc, tDiscretized, [thetaInit; omegaInit]);

% Separate soln into individual solutions
theta = soln(:,1); omega = soln(:,2);

%% plot stuff
plot(t,soln);