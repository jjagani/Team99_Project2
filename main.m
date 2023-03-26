clear;
clc;
close all;

tStart = 0; %Start Time of Discretization
tEnd = 1;  %End Time of Discretization
numSteps = 10000; %Number of Steps for ODE Solver
particle_diameter = 2.5; %Particle Diameter (um)

%% == Model Inputs ==
p_particle = 2;           % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
epsilon =    8.85e-12;     % Permittivity of Free Space (Assumed as permittivity of air)
q_part =     1.602e-19;    % Charge of Particles (Assume only one electron attaches)
spacing =    0.05;         % distance of plates from each other (m)
V =          120;          % Voltage on Plate (Volts)
conc =       21;           % concentration of particles (ug/m^3)
mu =         1.81e-5;      % dynamic viscosity of air
d =          5;         % Diameter of Particle (um)

%% == Calculations ==
tDiscretized = linspace(tStart, tEnd, numSteps); 
x0 = [0,0]; %Particle Initial Conditions
[t,soln] = ode45(@(t,x) odefunc(t,x,p_particle, epsilon, q_part, spacing, V, conc, mu, d), tDiscretized, x0);

%% == Plots ==
position = soln(:,1);
velocity = soln(:, 2);

cutoff = find(position > spacing, 1);
position = position(1:cutoff);
velocity = velocity(1:cutoff);
tDiscretized = tDiscretized(1:cutoff);

plot(tDiscretized, position);
hold on
plot(tDiscretized, velocity);

