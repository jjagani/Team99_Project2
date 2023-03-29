% This script is to try and see if squaring an uniform random distribution 
% of numbers leads to a parabolic distribution. This will be evaluated
% visually

amountOfValues = 1000;

% preallocating to appease the MATLAB Gods
values = zeros(1, amountOfValues);

for x = 1:amountOfValues
    randNumber = rand(1,1) - .5;
    randNumber2 = randNumber^2;
    values(x) = randNumber2;
end
 
histogram(values)
max(values)