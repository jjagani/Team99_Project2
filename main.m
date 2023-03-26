clear;
clc;

% Define your starting time, ending time, and # of discretized times
tStart = 0;
tEnd = 1;
numSteps = 1000;
tDiscretized = linspace(tStart, tEnd, numSteps);

x0 = [0,0];
[t,soln] = ode15s(@odefunc, tDiscretized, x0);

plot(t, soln);