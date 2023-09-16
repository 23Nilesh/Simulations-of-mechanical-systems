clc; clearvars;
x1 = 1:1:60;             % delta = 60
x2 = 61:1:120;           % delta = 60
x3 = 121:1:240;          % delta = 120
x4 = 241:1:300;          % delta = 60
x5 = 301:1:360;          % delta = 60
beta1 = 60;       
beta2 = 120;
h = 8;

y1 = 0*x1 + 10;
y2 = y1 + h*(35*(x1/beta1).^4 - 84*(x1/beta1).^5 + 70*(x1/beta1).^6 - 20*(x1/beta1).^7);
y3 = 0*x3 + y2(length(y2));
y4 = y3(length(y3)) - h*(35*(x1/beta1).^4 - 84*(x1/beta1).^5 + 70*(x1/beta1).^6 - 20*(x1/beta1).^7);
y5 = 0*x5 + 10;

x = [x1 x2 x3 x4 x5];
y = [y1 y2 y3 y4 y5];
polarplot(x*pi/180, y, 'c', 'LineWidth',2);
title("Cam Profile");

%% SVAJ Diagram
figure;
for i = 2:length(y)
    y_v(i) = (y(i)-y(i-1));
    y_a(i) = (y_v(i)-y_v(i-1));
    y_J(i) = (y_a(i)-y_a(i-1));
end
% S - Position
subplot(2, 2, 1)
plot(x, y, 'r', 'LineWidth',2);
title('Position(m)'); xlabel('Angle(Degree)'); ylabel('Height(m)');

% V - Velocity
subplot(2, 2, 2)
plot(x, y_v, 'g', 'LineWidth',2);
title('Velocity');xlabel('Angle(Degree)'); ylabel('Velocity(m/s)');

% A - acceleration
subplot(2, 2, 3)
plot(x, y_a, 'b', 'LineWidth',2);
title('Acceleration'); xlabel('Angle(Degree)'); ylabel('Acc(m/s^2)');

% J - Jerk
subplot(2, 2, 4)
plot(x, y_J, 'm', 'LineWidth',2);
title('Jerk'); xlabel('Angle(Degree)'); ylabel('Jerk(m/s^3)');
