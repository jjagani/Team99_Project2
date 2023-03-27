clear;
clc;
close all;


tStart = 0;               % Start Time of Discretization
tEnd = 1;                 % End Time of Discretization
numSteps = 10000;         % Number of Steps for ODE Solver
particle_diameter = 2.5;  % Particle Diameter (um)
numPositionPoints = 50;  % Number of points to plot along position graph

%% == Model Inputs ==
p_particle = 2;              % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
epsilon =    8.85e-12;       % Permittivity of Free Space (Assumed as permittivity of air)
q_particle = 1.602e-19;  % Charge of Particles (Assume only one electron attaches)
spacing =    0.05;           % distance of plates from each other (m)
V =          120;            % Voltage on Plate (Volts)
conc =       21;             % concentration of particles (ug/m^3)
mu =         1.81e-5;        % dynamic viscosity of air
diam =       5;              % Diameter of Particle (um)

%% == Calculations ==
tDiscretized = linspace(tStart, tEnd, numSteps); 
x0 = [0,0]; %Particle Initial Conditions
[t,soln] = ode45(@(t,x) odefunc(t,x,p_particle, epsilon, q_particle, spacing, V, conc, mu, diam), tDiscretized, x0);

%% == Plots ==
h_position = soln(:,1);
h_velocity = soln(:, 2);

% cutoff once particle hits the plate
cutoff = find(h_position > spacing, 1);
h_position = h_position(1:cutoff);
h_velocity = h_velocity(1:cutoff);
tDiscretized = tDiscretized(1:cutoff);

% calculate vertical position by eulers method on tDiscretized and particle
% speed function (the air moves faster in the middle
v_position = zeros(1, cutoff);
for i = 2:cutoff
    v_position(i) = v_position(i-1) + particleSpeed(h_position(i), spacing, 0, 1) * (tDiscretized(i) - tDiscretized(i-1));
end



%% Position and Velocity
figure(1)
yyaxis left
plot(tDiscretized, h_velocity);
xlim([0 tDiscretized(end)])
ylabel("Horizontal Velocity (m/s)")

yyaxis right
plot(tDiscretized, h_position);
xlim([0 tDiscretized(end)])
ylabel("Horizontal Position (m)")

title("Position and Velocity over Time")
xlabel("Times (s)")
legend("Horizontal Velocity", "Horizontal Position", Location="southeast")

%% Particle Path
figure(2)
hold on
plot(h_position, v_position)
scatter(h_position(1:floor(cutoff/numPositionPoints):end), ...
        v_position(1:floor(cutoff/numPositionPoints):end), ...
        15,"filled",MarkerEdgeColor="#0072bd",MarkerFaceColor="none")
xlim([0 spacing])

title("Position of Particle")
xlabel("Horizontal Position (m)")
ylabel("Vertical Position (m)")
