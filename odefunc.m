function dxdt = odefunc(t, x)
%t : time
%x : [x1, x2] x1 = position x, x2 = velocity x
%d : diameter of the particle (Assuming spherical particle) (mm)

p_part = 1;
d_part = 1;
a_vert = 1;
p_fluid = 1;
g = 1;
c_d = 1;
v_vert = 1;
q = 1;
sigma = 1;
epsilon = 1;
c_t = 1;
H = 1;
d_vert = 1;




dxdt(1) = x(2); 
dxdt(2) = (pi/2 * (p_fluid- p_part)*g*d_part^3+1/2*p_fluid*c_d*(pi/4*d_part^2)*v_vert^2 - q*sigma/(2*pi*epsilon) + q^2*c_t/(2*epsilon)*(2*d_vert-H)) / (pi/6*p_part*d_part^3);
%1/mp * ( q^2 * c / (2 * epsilon) * (2*x(1) - w) + (q *  V) / (4 * pi * w) - 3*pi*mu*d * x(2));
dxdt = transpose(dxdt);
end