clc; clearvars;
a = 5;     b = 13;    c = 7;
theta2 = 0:2:360;
cc = 0*theta2+c;

%%
teta = asin((c-a*sind(theta2))/b);
Ax = a*cosd(theta2);
Ay = a*sind(theta2);
Bx = Ax+b*cos(teta);
By = 0*sind(theta2)+c;
for i = 1:length(theta2)
    x(i) = (Ax(i)+Bx(i))/2;
    y(i) = (Ay(i)+By(i))/2;

    plot([0 Ax(i) Bx(i)], [0 Ay(i) By(i)], 'b-o', 'LineWidth',2);
    hold on;
    plot(x, y, 'r');
    plot(x(i), y(i), "c-o", LineWidth=2);
    plot(theta2, cc, 'g', 'LineWidth',2.5);
    rectangle('Position',[Bx(i)-0.75 By(i)-0.5 1.5 1.5], 'FaceColor','y');
    hold off;
    axis([-10 20 -10 20])
    axis square;
    pause(0.01);

end
grid minor;