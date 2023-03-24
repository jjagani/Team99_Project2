function derivs = derivFunc(time, vars) % vars(1) is theta; vars(2) is omega
% Define relevant constants
length = 1; g = 9.81;
% Define derivatives of your individual solution components:
derivs(1) = vars(2);
derivs(2) = -g/length*sin(vars(1));
derivs = transpose(derivs);