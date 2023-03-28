clear;
clc;
close all;


tStart = 0;               % Start Time of Discretization
tEnd = 10;                 % End Time of Discretization
numSteps = 10000;         % Number of Steps for ODE Solver
particle_diameter = 2.5;  % Particle Diameter (um)
numPositionPoints = 50;  % Number of points to plot along position graph

%% == Model Inputs ==
p_particle =  2;              % density of particle (g/cm^3) (Avg density of PM2.5 and PM10 particles)
epsilon =     8.85e-12;       % Permittivity of Free Space (Assumed as permittivity of air)
q_particle =  1.602e-19;      % Charge of Particles (Assume only one electron attaches)
spacing =     0.1;           % distance of plates from each other (m)
V =           400;            % Voltage on Plate (Volts)
conc =        75;             % concentration of particles (ug/m^3)
mu =          1.81e-5;        % dynamic viscosity of air
diam =        5;              % Diameter of Particle (um)
maxAirspeed = 5;              % Maximum airspeed in center (m/s)



particleData = [p_particle epsilon q_particle spacing V conc mu diam maxAirspeed];
initialCond = [0 0];
tDiscretized = linspace(tStart, tEnd, numSteps);
simData = [tDiscretized 100];

%% == Calculations ==

[tDiscretized, h_position, h_velocity, v_position] = simParticle(particleData, initialCond, tDiscretized);

%% ==Model Dependent variables==
num_plates = 50;              % Number of plates in full size tower
num_capacitors = num_plates - 1; %Number of capacitors in full size tower
l =           5;              % Length of capacitor plates (vertical direction)
w =           2;              % Width of capacitor  plates (horizontal direction)
crit_h=       v_position(end);            % Lowest height at which first particles get caught
capture_time = tDiscretized(end);                      % time to capture of particle at crit_h
volume_capacitor = ((l - crit_h) * w * spacing); %volume between single capacitor plates used to capture particles
volume_capacitor_total = volume_capacitor * num_capacitors; %volume between all capacitor plate
airflow_fan = volume_capacitor_total / capture_time * 60; %Airflow of entrance/exit fan in m^3 / min
disp(airflow_fan);
%x0 = [0,0]; %Particle Initial Conditions
%[t,soln] = ode45(@(t,x) odefunc(t,x,p_particle, epsilon, q_particle, spacing, V, conc, mu, diam), tDiscretized, x0);

%% == Plots ==

% cutoff once particle hits the plate
%cutoff = find(h_position > spacing, 1);
%h_position = h_position(1:cutoff);
%h_velocity = h_velocity(1:cutoff);
%tDiscretized = tDiscretized(1:cutoff);

% calculate vertical position by eulers method on tDiscretized and particle
% speed function (the air moves faster in the middle
%v_position = zeros(1, cutoff);
%for i = 2:cutoff
%    v_position(i) = v_position(i-1) + particleSpeed(h_position(i), spacing, 0, 1) * (tDiscretized(i) - tDiscretized(i-1));
%end

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
scatter(h_position(1:floor(length(h_position)/numPositionPoints):end), ...
        v_position(1:floor(length(h_position)/numPositionPoints):end), ...
        15,"filled",MarkerEdgeColor="#0072bd",MarkerFaceColor="none")
xlim([0 spacing])

title("Position of Particle")
xlabel("Horizontal Position (m)")
ylabel("Vertical Position (m)")
