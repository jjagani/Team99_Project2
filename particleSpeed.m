function [velocity] = particleSpeed(x_pos, spacing, minVel, maxVel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
velocity = (1 - (abs(spacing / 2 - x_pos) / (spacing / 2)).^2);
velocity = velocity * (maxVel-minVel) + minVel;
end

