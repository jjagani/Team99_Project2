function [tDiscretized, h_position, h_velocity, v_position] = simParticle(particleData, intialCond, simData)
%simParticle simulates one particle given its parameters

%% ======= DATA SETUP =======
%% particle data that does not change
% must be input in this order
p_particle =  particleData(1)
epsilon =     particleData(2)
q_particle =  particleData(3)
spacing =     particleData(4)
V =           particleData(5)
conc =        particleData(6)
mu =          particleData(7)
diam =        particleData(8)

%% intial conditions of the particle
% of the form [position velocity]

%% data for running the simulation
tDiscretized  =  simData(1);
outputSteps = simData(2); % number of steps of position to output to save memory

%% Run simulation
[~,soln] = ode45(@(t,x) odefunc(t,x,p_particle, epsilon, q_particle, spacing, V, conc, mu, diam), tDiscretized, intialCond);
    
%% process results
% cutoff data when it hits the plate (or where the plate would be)

cutoff = find(soln(:,1) > spacing, 1);
h_position = soln(1:cutoff,1);
h_velocity = soln(1:cutoff,2);
tDiscretized = tDiscretized(1:cutoff);

% calculate vertical position
v_position = zeros(1, cutoff);
for i = 2:cutoff
    v_position(i) = v_position(i-1) + particleSpeed(h_position(i), spacing, 0, 1) * (tDiscretized(i) - tDiscretized(i-1));
end

