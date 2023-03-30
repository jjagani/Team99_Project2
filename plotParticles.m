function [] = plotParticles(ultimateDataMatrix)
%PLOTPARTICLES Summary of this function goes here
%   Detailed explanation goes here
dim = size(ultimateDataMatrix);
tDiscretizedMat = squeeze(ultimateDataMatrix(:,1,:));
hPosMat = squeeze(ultimateDataMatrix(:,2,:));
hVelMat = squeeze(ultimateDataMatrix(:,3,:));
vPosMat = squeeze(ultimateDataMatrix(:,4,:));


%% Setup Color
color2 = [237, 177, 32] / 255;
color1 = [77, 190, 238] / 255;
alpha = linspace(0, 1, dim(1));
colors = alpha(:)*color1 + (1-alpha(:))*color2;
%% Plot Particles Position
figure(1)
hold on
for particle = 1:dim(1)
    plot(hPosMat(particle,:), vPosMat(particle,:), Color=[colors(particle,:)])
end
xlim([0 max(hPosMat(:,end))])

title("Position of Particle")
xlabel("Horizontal Position (m)")
ylabel("Vertical Position (m)")
end