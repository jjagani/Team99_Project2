function [] = simParticle(particleData, intialCond, simData)
%simParticle simulates one particle given its parameters

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
    tDisctized  =  simData(1)
    outputSteps = simData(2) % number of steps of position to output to save memory
    
end

