function dxdt = odefunc(t, x, p_particle, epsilon, q_part, spacing, V, conc, mu, d)
% x =    [position velocity]
% dxdt = [velocity acceleration]

%% == Unit Conversion ==
p_particle = p_particle * 1e-3;
conc =             conc * 1e-9;
d = d * 1e-6;

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