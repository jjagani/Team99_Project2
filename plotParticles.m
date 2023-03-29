function [] = plotParticles(ultimateDataMatrix)
%PLOTPARTICLES Summary of this function goes here
%   Detailed explanation goes here
dim = size(ultimateDataMatrix);
tDiscretizedMat = ultimateDataMatrix(:,1,:);
hPosMat = ultimateDataMatrix(:,2,:);
hVelMat = ultimateDataMatrix(:,3,:);
vPosMat = ultimateDataMatrix(:,4,:);

%disp(size(hPosMat))
%% Plot Particles Position
figure(1)
hold on
for particle = 1:dim(1)
    plot(hPosMat(:,:,particle), vPosMat(:,:,particle))
end
end