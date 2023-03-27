clear;
clc;

% Define your starting time, ending time, and # of discretized times
tStart = 0;
tEnd = 30;
numSteps = 6000;
tDiscretized = linspace(tStart, tEnd, numSteps);

x0 = [0,0];
[t,soln] = ode45(@odefunc, tDiscretized, x0);

plot(t, soln);