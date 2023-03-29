function [] = plotParticles(ultimateDataMatrix)
%PLOTPARTICLES Summary of this function goes here
%   Detailed explanation goes here
dim = size(ultimateDataMatrix);
tDiscretizedMat = squeeze(ultimateDataMatrix(:,1,:));
hPosMat = squeeze(ultimateDataMatrix(:,2,:));
hVelMat = squeeze(ultimateDataMatrix(:,3,:));
vPosMat = squeeze(ultimateDataMatrix(:,4,:));

disp(dim)
disp(size(hPosMat))
%% Plot Particles Position
figure(1)
hold on
for particle = 1:dim(1)
    plot(hPosMat(particle,:), vPosMat(particle,:))
end
end