clc; clearvars;
m = 1;  % Mass(Kg)
k = 10; % Spring Constant
c = 1;  % Drag coefficient

% Time Variable
ts = 10;
dt = 0.05;
t = 0:dt:ts;
% Initial condn
Ls = 2; % Length of spring
x(1) = 0.5; % initial length
xdot(1) = 0;

% Loop
for i = 1:length(t)
    xrange = 0:0.1:10;
    yrange = ones(1, 101)*2;
    xddot = -c/m*xdot(i) - k/m*x(i);    
    xdot(i+1) = xdot(i) + xddot*dt;
    x(i+1) = x(i) + xdot(i+1)*dt;

    plot([0 Ls+x(i)], [0 0],'r', 'LineWidth',2);
    hold on;
    rectangle('Position',[Ls+x(i) -0.125 0.25 0.25], 'FaceColor','y');
    plot(t(1:i), Ls+x(1:i), 'g', 'LineWidth',2);
    plot(xrange, yrange, 'm');
    hold off;
    title('Initial Velocity = 0 m/s');
    axis([0 10 -0.5 2.7]);
    grid on;
    pause(dt);
end
