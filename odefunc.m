function dxdt = odefunc(t, x)
%t : time
%x : [x1, x2] x1 = position x, x2 = velocity x
%d : diameter of the particle (Assuming spherical particle) (mm)

%% == Constants ==
p_particle = 10;           % density of particle (g/cm^3)
epsilon =    8.85e-12;     % Permittivity of Free Space (Assumed as permittivity of air)
q_part =     1.602e-19;    % Charge of Particles
spacing =    0.05;         % distance of plates from each other (m)
V =          120;          % Voltage on Plate (Volts)
conc =       21;           % concentration of particles (ug/m^3)
mu =         1.81e-5;      % dynamic viscosity of air
d =          5e-6;         % PE

%% == Unit Conversion ==
p_particle = p_particle * 1e-3;
conc =             conc * 1e-9;

%% == Forces ==
drag = 3*pi * mu * d^2 * x(2)^2;
field_plate = q_part * V / (4*pi * spacing);
field_charges = ((q_part^2 * conc)/(2 * epsilon)) * (2 * x(1) - spacing);

%% == DiffEqs ==
mp = (pi / 6) * p_particle * d ^ 3; 
dxdt(1) = x(2); 
dxdt(2) = 1/mp * (field_charges + field_plate - drag);
%disp(x(2))
dxdt = transpose(dxdt);
end