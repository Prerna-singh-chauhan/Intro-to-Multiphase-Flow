r1 = input("inner radius of the sphere ");
r=input("outer radius of insulated sphere ");
T1 = input("temperature of inner surface "); 
Tinf = input("temperature of surroundings "); 
k = input("thermal conductivity of insulation "); 
h = input("convective heat transfer coefficient "); 
r2_vec = r1:0.01:r; 
r=h/k;
Q_vec = zeros(size(r2_vec));
for i = 1:length(r2_vec)
    r2 = r2_vec(i);
    A = 4*pi*r2^2;
    R_cond = log(r2/r1)/(2*pi*k); 
    R_conv = 1/(h*A);
    R_total = R_cond + R_conv; 
    Q = (T1-Tinf)/R_total;
    Q_vec(i) = Q;
end

plot(r2_vec, Q_vec)
line([R_critical, R_critical], [0, max(Q_vec)], 'LineStyle', '--', 'Color', 'r');
text(R_critical, 0.9*max(Q_vec), 'R_{critical}', 'HorizontalAlignment', 'center')
hold off
xlabel('Outer radius of insulation')
ylabel('Rate of Heat transfer')
title('Rate of Heat transfer vs outer radius of insulation of a sphere')