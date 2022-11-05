clc; clearvars;

% Physical Properties
m1 = 1.5; m2 = 1.1;  % Mass(Kg)
l1 = 1;   l2 = 1.2;  % Length(m)
k1 = 4;   a = 1;     g = 9.8;

% Time Variable
ts = 10;  dt = 0.1;  t = 0:dt:ts;

% Initaial Conditions
thdot1(1) = 0;  thdot2(1) = 0;
th1(1) = pi/3;  th2(1) = pi/3;

for i = 1:length(t) 
    thddot1 = (k1*a^2*(th2(i)-th1(i)) - m1*g*l1*th1(i))/(m1*l1^2); % Get position and velocity from acceleration by integrating twice
    thdot1(i+1) = thdot1(i) + thddot1*dt;
    th1(i+1) = th1(i)+thdot1(i+1)*dt;

    thddot2 = (k1*a^2*(th1(i)-th2(i)) - m2*g*l2*th2(i))/(m2*l2^2); % Get position and velocity from acceleration by integrating twice
    thdot2(i+1) = thdot2(i) + thddot2*dt;
    th2(i+1) = th2(i)+thdot2(i+1)*dt;

    subplot(2, 1, 1);
    plot([0 l1*sin(th1(i))], [0 -l1*cos(th1(i))], 'r-o', 'LineWidth',2);
    hold on;
    plot([0 l2*sin(th2(i))]+1.5, [0 -l2*cos(th2(i))], 'g-o', 'LineWidth',2);
    plot([0.8*sin(th1(i)) a*sin(th2(i))+1.5], [-0.8*cos(th1(i)) -a*cos(th2(i))], 'b', 'LineWidth',2);
    axis([-2 3.5 -2 3.5]);
    axis('square');
    hold off;
    title('Double Pendulum Spring System');
    legend('pendulum', 'pendulum', 'spring', 'Location','northwest');
    
    subplot(2, 1, 2);
    plot(th1, 'r', 'LineWidth',2);
    hold on;
    plot(th2, 'g', 'LineWidth',2);
    hold off;
    axis([-2 120 -2 5]);
    grid on;

    pause(0.05);
end