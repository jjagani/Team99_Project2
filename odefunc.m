function dxdt = odefunc(t, x)
%t : time
%x : [x1, x2] x1 = position x, x2 = velocity x
%d : diameter of the particle (Assuming spherical particle) (mm)

p = 1; %density of particle (g/cm^3)
epsilon = 8.85e-12; %Permittivity of Free Space (Assumed as permittivity of air)
q = 1.602e-19; %Charge of Particles
w = 2; %distance of plates from each other (m)
l = 1; %length of plate (m)
h = 2; %height of plate (m)
V = 10; %Voltage on Plate (Volts)
c = 21; %concentration of particles (ug/m^3)
mu = 1.81e-5; %dynamic viscosity of air
d = 5;

p = p * 1e-3 * 1e-6;
c = c * 1e-9;
d = d / 1000;
mp = (pi / 6) * p * d ^ 3; 
dxdt(1) = x(2); 
dxdt(2) = 1/mp * ( q^2 * c / (2 * epsilon) * (2*x(1) - w) + q * V / (4*pi*epsilon*l*d*w) - 3*pi*mu*d * x(2));
disp(x(2))
dxdt = transpose(dxdt);
end