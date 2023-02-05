%% S4_Q1
clc; clearvars;
figure;
%Properties
m1 = 1;        m2 = 1;           m3 = 1;
L1 = 1;        L2 = 0.75;        L3 = 0.5;

% Initial condn
th1(1) = pi/3;   th2(1) = pi/4;  th3(1) = pi/2;
th1_dot(1) = 0;  th2_dot(1) = 0; th3_dot(1) = 0;

% Time step
ts = 10; dt = 0.05; t = 0:dt:ts;

% Loop
for i = 1:length(t)
    % 1st matrix Inertia
    Ms1 = 1.5*cos(th2(i)) + cos(th3(i)) + cos(th2(i)+th3(i))/2 + 5/3;
    Ms2 = cos(th3(i))/2 + cos(th2(i) + th3(i))/2 + 1/3;
   
    M = [3*cos(th2(i)) + cos(th3(i)) + cos(th2(i)+th3(i)) + 4, Ms1, Ms2;
         Ms1, cos(th3(i)) + 5/3, cos(th3(i))/2 + 1/3;
         Ms2, cos(th3(i))/2 + 1/3, 1/3];
     
   % 2nd matrix Gravity torque
    Gs1 = 981*cos(th1(i)+th2(i)+th3(i))/200;
    G = [981*cos(th1(i))/40 + Gs1 + 2943*cos(th1(i)+th2(i))/200, ...
        991*cos(th1(i)+th2(i)+th3(i))/200 + 2973*cos(th1(i)+th2(i))/200,  Gs1]';
   
   % 3rd Matrxi Drag coefficient Matrix       
    Cs5 = (th1_dot(i) + th2_dot(i) + th3_dot(i))^2;
    Cs6 = th1(i) + th2(i) + th3(i);
    Cs7 = cos(th1(i))*th1_dot(i)^2;
    Cs8 = sin(th1(i))*th1_dot(i)^2;
    Cs9 = (th1_dot(i)+th2_dot(i))^2;
    Cs10 = th1(i) + th2(i);
    Cs1 = Cs8 + sin(Cs6)*Cs5/2 + sin(Cs10)*Cs9;
    Cs2 = cos(Cs6)*Cs5/2 + cos(Cs10)*Cs9 + Cs7;
    Cs3 = cos(Cs10)*Cs9/2 + Cs7;
    Cs4 = Cs8 + sin(Cs10)*Cs9/2;
   
    C = [Cs2*(sin(th1(i)) + sin(Cs6)/2 + sin(Cs10)) ...
        - Cs1*(cos(th1(i)) + cos(Cs6)/2 + cos(Cs10)) ...
        - Cs4*(cos(th1(i)) + cos(Cs10)/2) + Cs3*(sin(th1(i)) ...
        + sin(Cs10)/2);
        Cs2*(sin(Cs6)/2 + sin(Cs10))  - Cs1*(cos(Cs6)/2 + ...
        cos(Cs10)) + sin(Cs10)*Cs3/2 - cos(Cs10)*Cs4/2;
        sin(Cs6)*Cs2/2  - cos(Cs6)*Cs1/2];    
   
    % Solving equation
    th_ddot = M\(-C-G);

    th1_dot(i+1) = th1_dot(i) + th_ddot(1)*dt;
    th1(i+1) = th1(i) + th1_dot(i+1)*dt;
   
    th2_dot(i+1) = th2_dot(i) + th_ddot(2)*dt;
    th2(i+1) = th2(i) + th2_dot(i+1)*dt;
   
    th3_dot(i+1) = th3_dot(i) + th_ddot(3)*dt;
    th3(i+1) = th3(i) + th3_dot(i+1)*dt;
   
    plot([0 L1*cos(th1(i))], [0 L1*sin(th1(i))], 'r-o', 'LineWidth',2);
    hold on;
    
    plot([L1*cos(th1(i)) L1*cos(th1(i))+L2*cos(th1(i)+th2(i))]...
        , [L1*sin(th1(i)) L1*sin(th1(i))+L2*sin(th1(i)+th2(i))], 'g-o', 'LineWidth',2);
    
    plot([L1*cos(th1(i)) L1*cos(th1(i))+L2*cos(th1(i)+th2(i))],...
        [L1*sin(th1(i)) L1*sin(th1(i))+L2*sin(th1(i)+th2(i))],...
         'b-o', 'LineWidth',2);
    
    legend('Link 1', 'Link 2', 'Link 3');
    axis([-3 3 -3 3]);
    axis('square');
    hold off;    
   
    pause(0.05);
end

figure;
plot(t(1:i), th1(1:i), 'r', 'LineWidth',2);
hold on;
plot(t(1:i), th2(1:i), 'b', 'LineWidth',2);
plot(t(1:i), th3(1:i), 'g', 'LineWidth',2);
grid on;
legend('Link 1', 'Link 2', 'Link 3');
hold off;


