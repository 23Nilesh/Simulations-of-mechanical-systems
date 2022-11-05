clc; clearvars;
% Physical Properties
m1 = 1; m2 = 2; m3 = 3;   % Mass(Kg)
k1 = 3; k2 = 1.5; k3 = 2; k4 = 1; % Spring constant(N-m)
l1 = 1.5; l2 = 1.2; l3 = 1.1; l4 = 1.8; % Length(m)

% Time Variable
ts = 10;  dt = 0.1;  t = 0:dt:ts;

% Initial Conditions
x1(1) = 0.1;  x2(1) = -0.1; x3 = 0.2;
xdot1(1) = 0;  xdot2(1) = 0; xdot3(1) = 0;

for i = 1:length(t)
    xddot1 = (k2*x2(i) - (k1+k2)*x1(i))/m1;
    xdot1(i+1) = xdot1(i) + xddot1*dt;
    x1(i+1) = x1(i) + xdot1(i+1)*dt;

    xddot2 = (k2*x1(i)+k3*x3(i)-(k2+k3)*x2(i))/m2;
    xdot2(i+1) = xdot2(i) + xddot2*dt;
    x2(i+1) = x2(i) + xdot2(i+1)*dt;

    xddot3 = (k3*x2(i) - (k3+k4)*x3(i))/m3;
    xdot3(i+1) = xdot3(i) + xddot3*dt;
    x3(i+1) = x3(i) + xdot3(i+1)*dt;

    subplot(2, 1, 1);
    plot([0 l1+x1(i) l1+l2+x1(i)+x2(i) l1+l2+l3+x1(i)+x2(i)+x3(i) 5.6], [2 2 2 2 2], 'b-|', 'LineWidth',2);
    hold on;
    rectangle('Position',[l1+x1(i)+0.1 2 0.4 0.6]-0.2,'FaceColor','r');
    rectangle('Position',[l1+l2+x1(i)+x2(i)+0.1 2 0.4 0.6]-0.2,'FaceColor','g');
    rectangle('Position',[l1+l2+l3+x1(i)+x2(i)+x3(i)+0.1 2 0.4 0.6]-0.2,'FaceColor','y');
    hold off;
    axis([-1 6 1 6]);
    title('Spring mass system in series');
    legend('Spring', 'Location','north')

    subplot(2, 1, 2);
    xrange = 1:1:120;
    yrange = ones(1, 120);
    plot(l1+x1, 'r', 'LineWidth',2);
    hold on;
    plot(xrange, yrange*l1);
    plot(l1+l2+x1+x2, 'g', 'LineWidth',2);
    plot(xrange, yrange*(l1+l2));
    plot(l1+l2+l3+x1+x2+x3, 'y', 'LineWidth',2);
    plot(xrange, yrange*(l1+l2+l3));
    hold off;
    axis([0 120 0 5]);
    title('Amplitude of masses from their mean position');
    grid minor;

    pause(dt);
end